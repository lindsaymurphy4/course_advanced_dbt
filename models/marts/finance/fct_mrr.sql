WITH

customer_revenue_per_month AS
(
    SELECT date_month, user_id, plan_name, pricing AS mrr, TRUE AS is_active
    FROM {{ ref('int_subscriptions_per_month')}}
),

customer_churn_per_month AS
(
    SELECT DATEADD('month', 1, DATE_TRUNC('month', ends_at)) AS date_month, user_id, plan_name, pricing AS mrr, FALSE AS is_active
    FROM {{ ref('dim_subscriptions')}}
    WHERE ends_at IS NOT NULL AND (DATEADD('month', 1, DATE_TRUNC('month', ends_at)), user_id) NOT IN (SELECT DISTINCT date_month, user_id FROM customer_revenue_per_month)
),

unioned AS
(
    SELECT *
    FROM customer_revenue_per_month
    UNION ALL
    SELECT *
    FROM customer_churn_per_month
),

mrr_changes AS
(
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY date_month) AS subscription_row_num,
        COALESCE(LAG(is_active) OVER (PARTITION BY user_id ORDER BY date_month), FALSE) AS previous_month_is_active,
        COALESCE(LAG(mrr) OVER (PARTITION BY user_id ORDER BY date_month), 0) AS previous_month_mrr,
        mrr - previous_month_mrr AS mrr_change
    FROM unioned
    ORDER BY user_id, date_month
)

SELECT
    {{  dbt_utils.generate_surrogate_key(['date_month', 'user_id']) }} AS id,
    date_month,
    user_id,
    plan_name,
    mrr AS mrr_amount,
    mrr_change,
    LEAST(mrr, previous_month_mrr) AS retained_mrr_amount,
    previous_month_mrr AS previous_month_mrr_amount,
    CASE
        WHEN subscription_row_num = 1
            THEN 'new'
        WHEN NOT(is_active) AND previous_month_is_active
            THEN 'churn'
        WHEN is_active AND NOT(previous_month_is_active)
            THEN 'reactivation'
        WHEN mrr_change > 0 THEN 'upgrade'
        WHEN mrr_change < 0 THEN 'downgrade'
    END AS change_category,
    subscription_row_num - 1 AS month_retained_number
FROM mrr_changes
ORDER BY
