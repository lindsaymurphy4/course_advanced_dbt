{{ config(materialized='table') }}

SELECT
    session_id,
    created_at,
    user_id,
    event_name,
    event_id,
    {{ rolling_aggregation('count', 'session_id', 'user_id', 'created_at', 30) }} 

FROM {{ ref('stg_bingeflix__events') }}
