{% macro rolling_aggregation(column_name, partition_by, aggregation_type, order_by, length_of_period) %}
    {{ aggregation_type }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ length_of_period - 1 }} PRECEDING AND CURRENT ROW
            ) AS {{ aggregation_type }}_{{ column_name }}_last_{{ length_of_period }}_periods
{% endmacro %}
