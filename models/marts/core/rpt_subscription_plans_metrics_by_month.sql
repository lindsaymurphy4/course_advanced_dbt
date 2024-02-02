WITH subscriptions_by_start_month AS (

    SELECT
        subscription_plan_id,
        plan_name,
        date_trunc('month', starts_at) AS start_month,
        count(DISTINCT subscription_id) AS total_subscription_per_month

    FROM {{ ref('dim_subscriptions') }}

    GROUP BY
        subscription_plan_id,
        plan_name,
        start_month

)

SELECT
    {{
        dbt_utils.generate_surrogate_key(
            [
                'plan_name',
                'start_month'
            ]
        )
    }} AS surrogate_key,

    subscription_plan_id,
    plan_name,
    start_month,
    total_subscription_per_month,

    {{
        rolling_aggregation_n_periods(
            'total_subscription_per_month',
            'subscription_plan_id',
            3,
            'avg',
            'start_month'
        )
    }},

    {{
        rolling_aggregation_n_periods(
            'total_subscription_per_month',
            'subscription_plan_id',
            3,
            'sum',
            'start_month'
        )
    }}

FROM subscriptions_by_start_month
