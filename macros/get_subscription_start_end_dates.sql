{% macro get_subscription_start_end_dates(starts_at, ends_at, interval = 'month') %}
    DATE(DATE_TRUNC('{{interval}}', starts_at)) AS start_{{interval}},
    CASE
        WHEN DATE(DATE_TRUNC('{{interval}}', starts_at)) = DATE(DATE_TRUNC('{{interval}}', ends_at)) THEN DATEADD('{{interval}}', 1, DATE(DATE_TRUNC('{{interval}}', ends_at)))
        WHEN ends_at IS NULL THEN DATE(DATEADD('{{interval}}', 1, DATE_TRUNC('{{interval}}', CURRENT_DATE)))
        ELSE DATE(DATE_TRUNC('{{interval}}', ends_at))
    END AS end_{{interval}}
{% endmacro %}
