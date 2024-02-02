WITH source AS (
    SELECT
        user_id,
        created_at,
        phone_number,
        NULLIF(deleted_at, '') AS deleted_at,
        username,
        name,
        sex,
        email,
        birthdate,
        region,
        country
    FROM {{ source('bingeflix', 'users') }}
)

SELECT * FROM source
