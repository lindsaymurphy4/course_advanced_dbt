{% macro rolling_aggregation_n_periods(column_name, partition_by, order_by, day_interval=7, aggregation_type=avg) %}
    {{ aggregation_type }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ day_interval }} PRECEDING AND CURRENT ROW
            ) AS {{ aggregation_type }}_{{ day_interval }}_periods_{{ column_name }}
{% endmacro %}
