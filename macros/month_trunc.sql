{% macro month_trunc(date_column) -%}
    date(date_trunc('month', date_column))
{%- endmacro %}
