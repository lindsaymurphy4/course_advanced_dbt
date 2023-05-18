WITH

source AS (
    SELECT
        *
    FROM
        {{ source('bingeflix', 'users') }}
)

SELECT * FROM source