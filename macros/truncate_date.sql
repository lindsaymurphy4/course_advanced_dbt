{% macro truncate_date(column_name, date_type='month') %}

DATE( DATE_TRUNC('{{ date_type }}', {{ column_name }}) )

{% endmacro %}