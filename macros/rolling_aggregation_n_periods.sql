{% macro rolling_aggregation_n_periods(column_name, partition_by, number_of_periods=2, aggregation_type='avg', order_by='created_at') %}
    {{aggregation_type}}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ number_of_periods - 1 }} PRECEDING AND CURRENT ROW
            ) AS {{ aggregation_type }}_{{ number_of_periods }}_periods_{{ column_name }}
{% endmacro %}
