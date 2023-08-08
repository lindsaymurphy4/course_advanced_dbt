{% macro rolling_average_n_periods(column_name, partition_by, order_by, number_of_periods=7) %}
    avg( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ number_of_periods }} PRECEDING AND CURRENT ROW
            ) AS avg_{{ number_of_periods }}_periods_{{ column_name }}
{% endmacro %}
