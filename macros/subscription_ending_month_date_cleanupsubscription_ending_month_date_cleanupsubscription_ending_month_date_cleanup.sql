{% macro subscription_ending_month_date_cleanup(start_date, end_date) %}
    CASE
        WHEN {{ start_date }} = {{ end_date }} THEN DATEADD('month', 1, {{ end_date }})
        WHEN {{ end_date }} IS NULL THEN DATE(DATEADD('month', 1, DATE_TRUNC('month', CURRENT_DATE)))
            ELSE {{ end_date }}
     END AS {{ end_date }}
{% endmacro %}
