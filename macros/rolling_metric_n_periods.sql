{% macro rolling_metric_n_periods(column_name, partition_by='user_id', order_by='created_at', metric='avg', num=7) %}
    {{ metric }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ num }} PRECEDING AND CURRENT ROW
            ) AS metric_n_periods_{{ column_name }}
{% endmacro %}
