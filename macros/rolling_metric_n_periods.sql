{% macro rolling_metric_n_periods(column_name, partition_by, order_by='created_at', metric='avg', periods=7) %}
    {{ metric }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ periods - 1 }} PRECEDING AND CURRENT ROW
            ) AS {{ metric }}_{{ periods }}_periods_{{ column_name }}
{% endmacro %}
