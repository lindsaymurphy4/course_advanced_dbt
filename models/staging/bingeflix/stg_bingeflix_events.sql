WITH source AS (

    SELECT * FROM {{ source('bingeflix', 'events') }}
    WHERE
        {{ limit_data_in_dev(ref_date = 'created_at') }}

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
