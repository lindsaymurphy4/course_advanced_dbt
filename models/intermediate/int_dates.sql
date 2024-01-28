with

date_spine as (

{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2019-01-01' as date)",
    end_date="cast('2030-01-01' as date)"
   )
}}
),

final as (
    select
        date_day as calendar_date,
        cast(date_trunc('week', date_day) as date) as date_week,
        cast(date_trunc('month', date_day) as date) as date_month,
        cast(date_trunc('quarter', date_day) as date) as date_quarter,
        cast(date_trunc('year', date_day) as date) as date_year,
        day(date_day) as day_of_month,
        year(date_day) as year_num,
        quarter(date_day) as quarter_num,
        month(date_day) as month_num
    from
        date_spine
)

select * from final
