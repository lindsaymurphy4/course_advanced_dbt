{% macro find_previous_partition(column_name, partition_by='user_id', partition_by_2='subscription_date', order_by='date_month', coalesce_value=FALSE) %}
    COALESCE(
            LAG({{ column_name }}) OVER (PARTITION BY {{ partition_by }}, {{ partition_by_2 }} ORDER BY {{ order_by }}),
            {{ coalesce_value }} 
        ) 
{% endmacro %}