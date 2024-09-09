{% macro rolling_average(column_name, partition_by, num_periods, order_by='created_at') %}
    avg( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN ({{ num_periods}} - 1) PRECEDING AND CURRENT ROW
            ) AS avg_{{ num_periods }}_periods_{{ column_name }}
{% endmacro %}