
{{
config(
    materialized = 'incremental',
    unique_key = ['event_id']
    )

}}

WITH source AS (

    SELECT * FROM {{ source('bingeflix', 'events') }}

{{  incremental_lookback_window() }}

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
