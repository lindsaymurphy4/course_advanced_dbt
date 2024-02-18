{% macro rolling_average_n_periods(column_name, partition_by, order_by='created_at', n=7) %}
    avg( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN ({{ n }} - 1) PRECEDING AND CURRENT ROW
            ) AS avg_n_periods_{{ column_name }}
{% endmacro %}
