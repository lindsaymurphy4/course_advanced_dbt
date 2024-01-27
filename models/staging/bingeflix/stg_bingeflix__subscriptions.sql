WITH source AS (

    SELECT * FROM {{ source('bingeflix', 'subscriptions') }}

),

renamed AS (

    SELECT
        subscription_plan_id,
        user_id,
        starts_at,
        ends_at,
        subscription_id

    FROM

        source

)

SELECT * FROM renamed
