WITH subscriptions_monthy AS
(
    SELECT
        date_month,
        plan_name,
        COUNT(user_id) AS "NUM_SUBSCRIPTIONS",
        SUM(pricing) AS "TOTAL_REVENUE"
    FROM {{ ref('int_subscriptions_per_month') }}
    GROUP BY 1,2
)

SELECT
    *,
    {{ rolling_average(['NUM_SUBSCRIPTIONS', 'TOTAL_REVENUE'], 'PLAN_NAME', time_unit='months', n_periods=3, order_by='DATE_MONTH') }},
    {{ rolling_average(['NUM_SUBSCRIPTIONS', 'TOTAL_REVENUE'], 'PLAN_NAME', time_unit='months', n_periods=6, order_by='DATE_MONTH') }}
FROM subscriptions_monthy
