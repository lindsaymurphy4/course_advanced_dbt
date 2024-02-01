{% macro rolling_average_over_set_number_of_periods(aggregation, column_name, partition_by, period, num, order_by) %}
    {{ aggregation }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY TO_CHAR({{ order_by }}, {{ period }})
                ROWS BETWEEN {{ num }} PRECEDING AND CURRENT ROW
            ) AS {{ aggregation }}_{{ num }}_{{ column_name }}
{% endmacro %}
