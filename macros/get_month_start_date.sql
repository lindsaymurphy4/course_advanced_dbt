{% macro get_month_start_date(date_column_name) %}
    DATE(DATE_TRUNC('month', {{ date_column_name }}))
{% endmacro %}
