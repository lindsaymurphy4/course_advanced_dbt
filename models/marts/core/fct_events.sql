{{ config(materialized='table') }}

with source as (
    select
        session_id,
        created_at,
        user_id,
        event_name,
        event_id

    from {{ ref('stg_bingeflix__events') }}
)

select * from source

