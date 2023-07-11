-- Returns the current timestamp in the UTC time zone
{% macro now_utc() %}
    CURRENT_TIMESTAMP()
{% endmacro %}

-- Returns the current timestamp in the America/Toronto time zone
{% macro now_eastern() %}
    CONVERT_TIMEZONE('America/New_York', CURRENT_TIMESTAMP())
{% endmacro %}
