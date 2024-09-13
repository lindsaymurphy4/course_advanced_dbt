{% macro rolling_aggregation(column_name, partition_by, agg_type='sum', order_by='created_at', period=7) %}
    {{ agg_type }} ( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ period }} PRECEDING AND CURRENT ROW
            )
{% endmacro %}
