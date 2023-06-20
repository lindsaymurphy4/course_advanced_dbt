WITH

date_spine AS (

{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2019-01-01' as date)",
    end_date="cast('2030-01-01' as date)"
   )
}}
),

final AS (
    SELECT
        date_day AS calendar_date,
        CAST(DATE_TRUNC('week', date_day) AS DATE) AS date_week,
        CAST(DATE_TRUNC('month', date_day) AS DATE) AS date_month,
        CAST(DATE_TRUNC('quarter', date_day) AS DATE) AS date_quarter,
        CAST(DATE_TRUNC('year', date_day) AS DATE) AS date_year,
        DAY(date_day) AS day_of_month,
        YEAR(date_day) AS year_num,
        QUARTER(date_day) AS quarter_num,
        MONTH(date_day) AS month_num
    FROM
        date_spine
)

SELECT * FROM final
