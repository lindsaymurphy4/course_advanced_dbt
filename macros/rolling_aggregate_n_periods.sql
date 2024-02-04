{% macro rolling_aggregate_n_periods(column_name, partition_by, num_periods=7, order_by='created_at', aggregation_function='avg') %}

    {{ aggregation_function }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ num_periods - 1 }} PRECEDING AND CURRENT ROW
            ) AS {{ aggregation_function }}_{{ num_periods }}_periods_{{ column_name }}

{% endmacro %}
