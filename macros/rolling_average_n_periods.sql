{% macro rolling_average_n_periods(column_name, partition_by, order_by='created_at', n_periods=6) %}
    avg( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ n_periods }} PRECEDING AND CURRENT ROW
            ) AS avg_{{ n_periods }}_periods_{{ column_name }}
{% endmacro %}
