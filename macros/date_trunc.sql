{% macro DATE_TRUNC(column_name, period="'month'") -%}
    DATE(DATE_TRUNC({{ period }}, {{ column_name }}))
{%- endmacro %}
