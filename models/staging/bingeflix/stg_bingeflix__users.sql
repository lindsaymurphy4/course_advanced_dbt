with source as (

    select * from {{ source('bingeflix', 'users') }}

),

final as (

    select
        user_id,
        created_at,
        phone_number,
        nullif(deleted_at, '') as deleted_at,
        username,
        name,
        sex,
        email,
        birthdate,
        region,
        country

    from source

)

select * from final
