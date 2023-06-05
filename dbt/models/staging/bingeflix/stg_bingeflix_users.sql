with

source as (
    select
        user_id,
        {{ rolling_average_7_periods('user_id', 'NULL', 'user_id') }},
        created_at,
        phone_number,
        deleted_at,
        username,
        name,
        sex,
        email,
        birthdate,
        region,
        country
    from {{ source('bingeflix', 'users') }}
)

select * from source
