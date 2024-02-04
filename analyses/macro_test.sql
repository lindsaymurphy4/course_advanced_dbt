SELECT
    {{ rolling_average_over_set_number_of_periods('gross_revenue','user_id', 'created_at', aggregation = 'sum', num=12) }}
    from ref {{ ref('fct_events') }}
