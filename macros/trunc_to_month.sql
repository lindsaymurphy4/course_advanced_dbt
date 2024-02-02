{% macro trunc_to_month(date, alias=none) %}
    DATE(DATE_TRUNC('month', {{ date }} ))
    {% if alias is not none %}
    AS {{ alias }}
    {% endif %}
{% endmacro %}
