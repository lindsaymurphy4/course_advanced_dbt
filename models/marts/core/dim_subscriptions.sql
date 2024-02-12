{% set import_subscriptions_final = unit_testing_select_table(final, ref('unit_test_expected_output_dim_subscriptions')) %}


WITH

final AS (
    SELECT
        s.subscription_id,
        s.subscription_plan_id,
        s.user_id,
        s.starts_at,
        s.ends_at,
        sp.plan_name,
        sp.pricing,
        sp.payment_period AS billing_period
    FROM
        {{ ref('stg_bingeflix__subscriptions') }} AS s
        LEFT JOIN {{ ref('stg_bingeflix__subscription_plans') }} AS sp
            ON s.subscription_plan_id = sp.subscription_plan_id
)

SELECT * FROM {{ import_subscriptions_final }}
