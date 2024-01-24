{{ config(tags="p0") }}


-- This model is created following the dbt MRR playbook: https://www.getdbt.com/blog/modeling-subscription-revenue/

WITH

-- Import CTEs
-- Get raw monthly subscriptions
monthly_subscriptions AS (
    SELECT
        subscription_id,
        user_id,
        starts_at,
        ends_at,
        plan_name,
        pricing,
        DATE(DATE_TRUNC('month', starts_at)) AS start_month,
        DATE(DATE_TRUNC('month', ends_at)) AS end_month
    FROM
        {{ ref('dim_subscriptions') }}
    WHERE
        billing_period = 'monthly'
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

        -- For users that cancel in the first month, set their end_month to next month because the subscription remains active until the end of the first month
        -- For users who haven't ended their subscription yet (end_month is NULL) set the end_month to one month from the current date (these rows will be removed from the final CTE)
        CASE
            WHEN start_month = end_month THEN DATEADD('month', 1, end_month)
            WHEN end_month IS NULL THEN DATE(DATEADD('month', 1, DATE_TRUNC('month', CURRENT_DATE)))
            ELSE end_month
        END AS end_month
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
        COALESCE(subscription_periods.monthly_amount, 0.0) AS mrr
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
),

-- Calculate subscriber level MRR (monthly recurring revenue)
subscription_revenue_by_month AS (
    SELECT
        date_month,
        user_id,
        subscription_id,
        mrr > 0 AS is_subscribed_current_month,

        -- Find the subscriber's first month and last subscription month
        MIN(CASE WHEN is_subscribed_current_month THEN date_month END) OVER (PARTITION BY user_id, subscription_id) AS first_subscription_month,
        MAX(CASE WHEN is_subscribed_current_month THEN date_month END) OVER (PARTITION BY user_id, subscription_id) AS last_subscription_month,
        first_subscription_month = date_month AS is_first_subscription_month,
        last_subscription_month = date_month AS is_last_subscription_month,
        mrr
    FROM
        mrr_base
),

-- Calculate subscriber level churn by month by getting row for month *after* last month of activity
subscription_churn_by_month AS (
    SELECT
        DATEADD(MONTH, 1, date_month)::DATE AS date_month,
        user_id,
        subscription_id,
        FALSE AS is_subscribed_current_month,
        first_subscription_month,
        last_subscription_month,
        FALSE AS is_first_subscription_month,
        FALSE AS is_last_subscription_month,
        0.0::DECIMAL(18, 2) AS mrr
    FROM
        subscription_revenue_by_month
    WHERE
        is_last_subscription_month = TRUE
),

-- Union monthly revenue and churn CTEs
unioned AS (
    SELECT * FROM subscription_revenue_by_month
    UNION ALL
    SELECT * FROM subscription_churn_by_month
),

-- Get prior month MRR and calculate MRR change
mrr_with_changes AS (
    SELECT
        *,

        COALESCE(
            LAG(is_subscribed_current_month) OVER (PARTITION BY user_id, subscription_id ORDER BY date_month),
            FALSE
        ) AS is_subscribed_previous_month,

        COALESCE(
            LAG(mrr) OVER (PARTITION BY user_id, subscription_id ORDER BY date_month),
            0.0
        ) AS previous_month_mrr_amount,

        mrr - previous_month_mrr_amount AS mrr_change
    FROM
        unioned
),

-- Add surrogate key and classify months as new, churn, reactivation, upgrade, downgrade, or renewal
final AS (
    SELECT
        mrr_with_changes.date_month,
        mrr_with_changes.user_id,
        mrr_with_changes.subscription_id,
        subscription_periods.starts_at,
        subscription_periods.ends_at,
        subscription_periods.plan_name,
        mrr AS mrr_amount,
        mrr_change,
        LEAST(mrr, previous_month_mrr_amount) AS retained_mrr_amount,
        previous_month_mrr_amount,

        CASE
            WHEN is_first_subscription_month THEN 'new'
            WHEN NOT(is_subscribed_current_month) AND is_subscribed_previous_month THEN 'churn'
            WHEN is_subscribed_current_month AND NOT(is_subscribed_previous_month) THEN 'reactivation'
            WHEN mrr_change > 0.0 THEN 'upgrade'
            WHEN mrr_change < 0.0 THEN 'downgrade'
            ELSE 'renewal'
        END AS change_category,

        -- Add month_retained_number for cohort analysis
        CASE
            WHEN change_category = 'churn' THEN NULL
            ELSE DATEDIFF('month', first_subscription_month, date_month)
        END AS month_retained_number

    FROM
        mrr_with_changes
        LEFT JOIN subscription_periods
            ON mrr_with_changes.user_id = subscription_periods.user_id
                AND mrr_with_changes.subscription_id = subscription_periods.subscription_id
    WHERE
        date_month <= DATE_TRUNC('month', CURRENT_DATE)
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['date_month', 'subscription_id', 'change_category']) }} AS surrogate_key,
    *
FROM final
