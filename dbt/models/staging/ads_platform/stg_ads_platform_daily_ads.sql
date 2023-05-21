with source as (

    select * from {{ source('ads_platform', 'daily_ads') }}

),

renamed as (

    select
        date,
        campaign_id,
        spend,
        cpm,
        ctr

    from source

)

select * from renamed