{% macro start_of_month(column_name) -%}
    DATE_TRUNC('month', {{column_name}} )
{%- endmacro %}
