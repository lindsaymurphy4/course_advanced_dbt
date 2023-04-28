-- Returns the current timestamp in the UTC time zone
{% macro now_utc() %}
    CURRENT_TIMESTAMP AT TIME ZONE 'UTC'
{% endmacro %}

-- Returns the current timestamp in the America/Toronto time zone
{% macro now_eastern() %}
    CURRENT_TIMESTAMP AT TIME ZONE 'America/Toronto'
{% endmacro %}