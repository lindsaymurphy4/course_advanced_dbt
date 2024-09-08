{% macro truncate_to_interval(column, interval='month') %}
    DATE(DATE_TRUNC('{{ interval }}', {{ column }}))
{% endmacro %}
