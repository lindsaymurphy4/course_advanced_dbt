{% macro date_truncate(time_interval, column_name) %}

 DATE(DATE_TRUNC({{ time_interval }}, {{ column_name }}))

{% endmacro %}
