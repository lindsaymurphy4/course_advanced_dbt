{{ config(
    materialized='incremental',
    unique_key='event_id'
    ) }}

SELECT
    session_id,
    created_at,
    user_id,
    event_name,
    event_id

FROM {{ ref('stg_bingeflix__events') }}

{{ incremental_where_clause() }}
