WITH subscriptions AS
(
    SELECT DISTINCT
        user_id,
        subscription_plan_id,
        DATE_TRUNC('month', starts_at) AS month_start,
        DATE_TRUNC('month', COALESCE(ends_at, SYSDATE())) AS month_end,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY starts_at ASC) AS subscription_num
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
),

final AS
(
    SELECT
        d.date_month,
        s.user_id,
        s.subscription_num,
        sp.plan_name,
        sp.pricing,
        ROW_NUMBER() OVER (PARTITION BY d.date_month, s.user_id ORDER BY s.subscription_num DESC) AS row_num
    FROM dates AS d
    INNER JOIN subscriptions AS s ON d.date_month >= s.month_start AND d.date_month <= s.month_end
    INNER JOIN subscription_plans AS sp ON s.subscription_plan_id = sp.subscription_plan_id
    ORDER BY d.date_month, s.user_id, s.subscription_plan_id
)

SELECT
    date_month,
    user_id,
    subscription_num,
    plan_name,
    pricing
FROM final
WHERE row_num = 1
