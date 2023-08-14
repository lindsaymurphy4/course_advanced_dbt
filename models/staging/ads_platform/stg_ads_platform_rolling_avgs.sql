with source as (
    select * from {{ ref('stg_ads_platform_daily_ads') }}
)

select
        date,
        campaign_id,
        surrogate_key,
        spend,
        {{ rolling_average_7_periods('spend', 'campaign_id', 'date desc') }},
        {{ rolling_average_n_periods('spend', 'campaign_id', 'date desc', 3) }}

from source
