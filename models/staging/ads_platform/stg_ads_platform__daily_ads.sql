with source as (

    select * from {{ source('ads_platform', 'daily_ads') }}

),

renamed as (

    select
        date,
        campaign_id,
        {{ dbt_utils.generate_surrogate_key(['date', 'campaign_id']) }} as surrogate_key,
        spend,
        cpm,
        ctr

    from source

)

select * from renamed
