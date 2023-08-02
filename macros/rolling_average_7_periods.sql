{% macro rolling_average_7_periods(column_name, partition_by, order_by='created_at') %}
    avg( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
            ) AS avg_7_periods_{{ column_name }}
{% endmacro %}
