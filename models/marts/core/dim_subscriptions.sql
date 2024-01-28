with

subscriptions as (
    select * from {{ ref('stg_bingeflix__subscriptions') }}
),

plans as (
    select * from {{ ref('stg_bingeflix__subscription_plans') }}
),

final as (
    select
        subscriptions.subscription_id,
        subscriptions.subscription_plan_id,
        subscriptions.user_id,
        subscriptions.starts_at,
        subscriptions.ends_at,
        plans.plan_name,
        plans.pricing,
        plans.billing_period
    from subscriptions
        left join plans
            on subscriptions.subscription_plan_id = plans.subscription_plan_id
)

select * from final
