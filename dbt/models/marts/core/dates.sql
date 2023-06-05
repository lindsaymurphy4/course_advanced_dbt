WITH

date_spine AS (

{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2019-01-01' as date)",
    end_date="cast('2020-01-01' as date)"
   )
}}
),

final AS (
    SELECT
        date_day AS calendar_date,
        DATE_TRUNC('week', date_day)::DATE AS date_week,
        DATE_TRUNC('month', date_day)::DATE AS date_month,
        DATE_TRUNC('quarter', date_day)::DATE AS date_quarter,
        DATE_TRUNC('year', date_day)::DATE AS date_year,
        DAY(date_day) AS day_of_month,
        YEAR(date_day) AS year_num, 
        QUARTER(date_day) AS quarter_num,
        MONTH(date_day) AS month_num
    FROM
        date_spine
)
SELECT * FROM final