with source as (

    select * from {{ source('bingeflix', 'subscription_plans') }}

),

renamed as (

    select
        subscription_plan_id,
        plan_name,
        {{ cents_to_dollars('pricing') }} AS pricing,
        payment_period

    from source

)

select * from renamed
