WITH source AS (

    SELECT * FROM {{ source('ads_platform', 'daily_ads') }}

),

renamed AS (

    SELECT
        date,
        campaign_id,
        {{ dbt_utils.generate_surrogate_key(['date', 'campaign_id']) }} AS surrogate_key,
        spend,
        cpm,
        ctr

    FROM source

)

SELECT
    *,
    {{ rolling_aggregate_periods('spend', 'campaign_id', 'avg', 'date', 7) }}
FROM renamed
