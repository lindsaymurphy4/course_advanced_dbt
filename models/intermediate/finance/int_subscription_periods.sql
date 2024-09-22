WITH

-- Import CTEs
-- Get raw monthly subscriptions
monthly_subscriptions AS (
    SELECT
        s.subscription_id,
        s.user_id,
        s.starts_at,
        s.ends_at,
        sp.plan_name,
        sp.pricing,
        DATE(DATE_TRUNC('month', s.starts_at)) AS start_month,
        DATE(DATE_TRUNC('month', s.ends_at)) AS end_month
    FROM
        {{ ref('stg_bingeflix__subscriptions') }} AS s
    LEFT JOIN {{ ref('stg_bingeflix__subscription_plans') }} AS sp
        ON s.subscription_plan_id = sp.subscription_plan_id
    WHERE
        sp.billing_period = 'monthly'
),

-- Use the dates spine to generate a list of months
months AS (
    SELECT
        calendar_date AS date_month
    FROM
        {{ ref('int_dates') }}
    WHERE
        day_of_month = 1
),

-- Logic CTEs
-- Create subscription period start_month and end_month ranges
subscription_periods AS (
    SELECT
        subscription_id,
        user_id,
        plan_name,
        pricing AS monthly_amount,
        starts_at,
        ends_at,
        start_month,
        {{get_subscription_end_month('start_month', 'end_month')}} AS end_month
    FROM
        monthly_subscriptions
),

-- Determine when given subscription plan's first and most recent months
subscribers AS (
    SELECT
        user_id,
        subscription_id,
        MIN(start_month) AS first_start_month,
        MAX(end_month) AS last_end_month
    FROM
        subscription_periods
    GROUP BY
        1, 2
),

-- Create one record per month between a subscriber's first and last month
subscriber_months AS (
    SELECT
        subscribers.user_id,
        subscribers.subscription_id,
        months.date_month
    FROM
        subscribers
        INNER JOIN months
            -- All months after start date
            ON months.date_month >= subscribers.first_start_month
                -- and before end date
                AND subscribers.last_end_month > months.date_month
),

-- Join together to create base CTE for MRR calculations
mrr_base AS (
    SELECT
        subscriber_months.date_month,
        subscriber_months.user_id,
        subscriber_months.subscription_id,
        COALESCE(subscription_periods.monthly_amount, 0.0) AS mrr,
        subscription_periods.starts_at,
        subscription_periods.ends_at,
        subscription_periods.plan_name
    FROM
        subscriber_months
        LEFT JOIN subscription_periods
            ON subscriber_months.user_id = subscription_periods.user_id
                AND subscriber_months.subscription_id = subscription_periods.subscription_id
                -- The month is on or after the subscription start date...
                AND subscriber_months.date_month >= subscription_periods.start_month
                -- and the month is before the subscription end date (and handle NULL case)
                AND (subscriber_months.date_month < subscription_periods.end_month
                    OR subscription_periods.end_month IS NULL)
)

SELECT
    *,
    {{dbt_utils.generate_surrogate_key(['user_id','subscription_id','date_month'])}} AS primary_key
FROM mrr_base
