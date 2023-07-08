WITH source AS (

    SELECT * FROM {{ source('bingeflix', 'events') }}

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
