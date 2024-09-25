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
        ctr,

        {{ rolling_operation_over_periods(column_name='spend', partition_by='campaign_id') }},
        {{ rolling_operation_over_periods(column_name='cpm', partition_by='campaign_id') }},
        {{ rolling_operation_over_periods(column_name='ctr', partition_by='campaign_id') }}

    FROM source

)

SELECT * FROM renamed
