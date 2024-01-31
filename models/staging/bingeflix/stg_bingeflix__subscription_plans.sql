WITH source AS (

    SELECT * FROM {{ source('bingeflix', 'subscription_plans') }}

),

renamed AS (

    SELECT
        subscription_plan_id,
        plan_name,
        {{ cents_to_dollars('pricing') }} AS pricing,
        payment_period

    FROM source

)

SELECT * FROM renamed
