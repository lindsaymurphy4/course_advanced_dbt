{% macro date_trunc(date_column, interval='month') %}
    DATE(DATE_TRUNC('{{ interval }}', {{ date_column }}))
{% endmacro %}
