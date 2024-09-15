-- Returns the current timestamp in the America/Toronto time zone
{% macro timestamp_to_start_of_month_Date(column_name) %}
    DATE(DATE_TRUNC('month',column_name))
{% endmacro %}
