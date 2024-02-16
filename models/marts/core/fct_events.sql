{{
    config(
        materialized='incremental',
        unique_key=['created_at', 'session_id'],
    ) 
}}

SELECT
    session_id,
    created_at,
    user_id,
    event_name,
    event_id

FROM {{ ref('stg_bingeflix__events') }}

WHERE 1=1
{{ incremental_where_clause('created_at', 7, 'month') }}
