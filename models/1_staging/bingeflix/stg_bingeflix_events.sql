{{
    config(
        materialized='incremental',
        unique_key='event_id'
    )
}}

WITH source AS (

    SELECT * FROM {{ source('bingeflix', 'events') }}

    {% if is_incremental() %}

    WHERE {{ incremental_3_day_lookback('created_at', -3, 'day') }}

    {% endif %}

),

renamed AS (

    SELECT
        session_id,
        created_at,
        user_id,
        event_name,
        event_id

    FROM source

)

SELECT * FROM renamed
