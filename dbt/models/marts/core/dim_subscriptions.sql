WITH

final AS (
    SELECT
        s.subscription_plan_id,
        s.user_id,
        s.starts_at,
        s.ends_at,
        s.subscription_id,
        sp.plan_name,
        sp.pricing,
        sp.payment_period AS billing_period
    FROM
        {{ ref('stg_bingeflix_subscriptions') }} AS s
        LEFT JOIN {{ ref('stg_bingeflix_subscription_plans') }} AS sp
)

SELECT * FROM final
