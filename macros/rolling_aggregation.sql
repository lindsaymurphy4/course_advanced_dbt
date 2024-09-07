{% macro rolling_aggregation(column_name, partition_by, aggregation_type='avg', order_by='created_at', length_of_period='7') %}
    {{ aggregation_type }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ length_of_period }} PRECEDING AND CURRENT ROW
            ) AS {{ aggregation_type }}_{{ length_of_period }}_periods_{{ column_name }}
{% endmacro %}
