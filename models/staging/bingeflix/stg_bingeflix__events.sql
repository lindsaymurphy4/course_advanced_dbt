{{
    config(
        materialized='incremental',
        unique_key='event_id'
    )
}}

    SELECT 
        session_id,
        created_at,
        user_id,
        event_name,
        event_id

     FROM {{ source('bingeflix', 'events') }}

WHERE 1=1
{{ incremental_macro('created_at', 3, 'day') }}
