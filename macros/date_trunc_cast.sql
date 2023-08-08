{% macro date_trunc_cast(date_interval = 'month', column_name = 'created_at') %}

DATE(DATE_TRUNC({{ date_interval }}, {{ column_name }} ) )

{% endmacro %}
