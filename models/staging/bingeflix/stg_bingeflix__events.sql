with source as (

    select * from {{ source('bingeflix', 'events') }}

),

renamed as (

    select
        session_id,
        created_at,
        user_id,
        event_name,
        event_id

    from source

)

select * from renamed
