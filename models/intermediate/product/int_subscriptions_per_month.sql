WITH subscriptions AS
(
    SELECT DISTINCT
        user_id,
        subscription_plan_id,
        DATE_TRUNC('month', starts_at) AS month_start,
        DATE_TRUNC('month', COALESCE(ends_at, SYSDATE())) AS month_end
    FROM {{ ref('stg_bingeflix__subscriptions') }}
),

subscription_plans AS
(
    SELECT
        subscription_plan_id,
        plan_name,
        pricing
    FROM {{ ref('stg_bingeflix__subscription_plans') }}
),

dates AS
(
    SELECT DISTINCT date_month
    FROM {{ ref('int_dates') }}
    WHERE
        calendar_date >= (SELECT MIN(month_start) FROM subscriptions)
        AND calendar_date <= SYSDATE()
    ORDER BY date_month
)

SELECT
    d.date_month,
    s.user_id,
    sp.plan_name,
    sp.pricing
FROM dates AS d
INNER JOIN subscriptions AS s ON d.date_month >= s.month_start AND d.date_month <= s.month_end
INNER JOIN subscription_plans AS sp ON s.subscription_plan_id = sp.subscription_plan_id
ORDER BY d.date_month, s.user_id, s.subscription_plan_id
