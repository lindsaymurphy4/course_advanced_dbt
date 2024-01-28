{{ config(tags="p0") }}

-- This model is created following the dbt MRR playbook: https://www.getdbt.com/blog/modeling-subscription-revenue/
-- Import CTEs
with subscriptions as (

    select * from {{ ref('dim_subscriptions') }}
    where
        billing_period = 'monthly'

),

-- Use the dates spine to generate a list of months
months as (

    select calendar_date as date_month
    from {{ ref('int_dates') }}
    where
        day_of_month = 1

),

-- Logic CTEs

-- Get raw monthly subscriptions
monthly_subscriptions as (

    select
        subscription_id,
        user_id,
        starts_at,
        ends_at,
        plan_name,
        pricing as monthly_amount,
        date(date_trunc('month', starts_at)) as start_month,
        date(date_trunc('month', ends_at)) as end_month

    from subscriptions 

),

-- Create subscription period start_month and end_month ranges
subscription_periods as (

    select
        subscription_id,
        user_id,
        plan_name,
        monthly_amount,
        starts_at,
        ends_at,
        start_month,

        -- For users that cancel in the first month, set their end_month to next month because the subscription remains active until the end of the first month
        -- For users who haven't ended their subscription yet (end_month is NULL) set the end_month to one month from the current date (these rows will be removed from the final CTE)
        case
            when start_month = end_month then dateadd('month', 1, end_month)
            when end_month is null then date(dateadd('month', 1, date_trunc('month', current_date)))
            else end_month
        end as end_month

    from monthly_subscriptions

),

-- Determine when given subscription plan's first and most recent months
subscribers as (

    select
        user_id,
        subscription_id,
        min(start_month) as first_start_month,
        max(end_month) as last_end_month

    from subscription_periods

    group by
        1, 2
),

-- Create one record per month between a subscriber's first and last month
subscriber_months as (

    select
        subscribers.user_id,
        subscribers.subscription_id,
        months.date_month

    from subscribers
        inner join months
            -- All months after start date
            on months.date_month >= subscribers.first_start_month
                -- and before end date
                and subscribers.last_end_month > months.date_month

),

-- Join together to create base CTE for MRR calculations
mrr_base as (

    select
        subscriber_months.date_month,
        subscriber_months.user_id,
        subscriber_months.subscription_id,
        coalesce(subscription_periods.monthly_amount, 0.0) as mrr

    from subscriber_months
        left join subscription_periods
            on subscriber_months.user_id = subscription_periods.user_id
                and subscriber_months.subscription_id = subscription_periods.subscription_id
                -- The month is on or after the subscription start date...
                and subscriber_months.date_month >= subscription_periods.start_month
                -- and the month is before the subscription end date (and handle NULL case)
                and (subscriber_months.date_month < subscription_periods.end_month
                    or subscription_periods.end_month is null)

),

-- Calculate subscriber level MRR (monthly recurring revenue)
subscription_revenue_by_month as (

    select
        date_month,
        user_id,
        subscription_id,
        mrr > 0 as is_subscribed_current_month,

        -- Find the subscriber's first month and last subscription month
        min(case when is_subscribed_current_month then date_month end) over (partition by user_id, subscription_id) as first_subscription_month,
        max(case when is_subscribed_current_month then date_month end) over (partition by user_id, subscription_id) as last_subscription_month,
        first_subscription_month = date_month as is_first_subscription_month,
        last_subscription_month = date_month as is_last_subscription_month,
        mrr

    from mrr_base

),

-- Calculate subscriber level churn by month by getting row for month *after* last month of activity
subscription_churn_by_month as (

    select
        dateadd(month, 1, date_month)::date as date_month,
        user_id,
        subscription_id,
        false as is_subscribed_current_month,
        first_subscription_month,
        last_subscription_month,
        false as is_first_subscription_month,
        false as is_last_subscription_month,
        0.0::decimal(18, 2) as mrr

    from subscription_revenue_by_month
    where
        is_last_subscription_month = true

),

-- Union monthly revenue and churn CTEs
unioned as (
    select * from subscription_revenue_by_month
    union all
    select * from subscription_churn_by_month
),

-- Get prior month MRR and calculate MRR change
mrr_with_changes as (

    select
        *,

        coalesce(
            lag(is_subscribed_current_month) over (partition by user_id, subscription_id order by date_month),
            false
        ) as is_subscribed_previous_month,

        coalesce(
            lag(mrr) over (partition by user_id, subscription_id order by date_month),
            0.0
        ) as previous_month_mrr_amount,

        mrr - previous_month_mrr_amount as mrr_change

    from unioned

),

-- Add surrogate key and classify months as new, churn, reactivation, upgrade, downgrade, or renewal
final as (

    select
        mrr_with_changes.date_month,
        mrr_with_changes.user_id,
        mrr_with_changes.subscription_id,
        subscription_periods.starts_at,
        subscription_periods.ends_at,
        subscription_periods.plan_name,
        mrr as mrr_amount,
        mrr_change,
        least(mrr, previous_month_mrr_amount) as retained_mrr_amount,
        previous_month_mrr_amount,

        case
            when is_first_subscription_month then 'new'
            when not(is_subscribed_current_month) and is_subscribed_previous_month then 'churn'
            when is_subscribed_current_month and not(is_subscribed_previous_month) then 'reactivation'
            when mrr_change > 0.0 then 'upgrade'
            when mrr_change < 0.0 then 'downgrade'
            else 'renewal'
        end as change_category,

        -- Add month_retained_number for cohort analysis
        case
            when change_category = 'churn' then null
            else datediff('month', first_subscription_month, date_month)
        end as month_retained_number

    from mrr_with_changes
        left join subscription_periods
            on mrr_with_changes.user_id = subscription_periods.user_id
                and mrr_with_changes.subscription_id = subscription_periods.subscription_id
    where
        date_month <= date_trunc('month', current_date)

)

select
    {{ dbt_utils.generate_surrogate_key(['date_month', 'subscription_id', 'change_category']) }} as surrogate_key,
    *
from final
