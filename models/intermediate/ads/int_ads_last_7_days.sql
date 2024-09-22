SELECT
    date,
    campaign_id,
    {{ dbt_utils.generate_surrogate_key(['date', 'campaign_id']) }} AS surrogate_key,
    spend,
    cpm,
    ctr,
    {{aggregate_over_period('sum',7,'days','spend','campaign_id','date')}},
    {{aggregate_over_period('sum',7,'days','cpm','campaign_id','date')}},
    {{aggregate_over_period('avg',7,'days','ctr','campaign_id','date')}}
FROM {{ref('stg_ads_platform__daily_ads')}}
