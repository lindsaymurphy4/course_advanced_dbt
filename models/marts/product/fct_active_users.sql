with events as (

    select
        user_id,
        date(created_at) as created_date,
        event_id as login_id

    from {{ ref('stg_bingeflix__events') }}
    where
        event_name = 'User Logged In'
),

date_spine as (

    select
        calendar_date,
        date_week

    from {{ ref('int_dates') }}

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['date_week', 'user_id']) }} as surrogate_key,
        date_week,
        user_id,
        count(distinct login_id) as login_count

    from
        date_spine
        left join events 
            on date_spine.calendar_date = events.created_date

    group by all

)

select * from final
