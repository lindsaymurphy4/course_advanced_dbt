with source as (

    select * from {{ source('bingeflix', 'subscriptions') }}

),

renamed as (

    select
        subscription_plan_id,
        user_id,
        starts_at,
        ends_at,
        subscription_id

    from source

)

select * from renamed
