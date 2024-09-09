{% macro rolling_aggregation(
        column_name,
        partition_by,
        num_periods=7,
        agg_func = 'avg',
        order_by='created_at') %}
    {{ agg_func }}({{ column_name }}) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ num_periods - 1 }} PRECEDING AND CURRENT ROW
            ) AS {{ agg_func }}_{{ num_periods }}_periods_{{ column_name }}
{% endmacro %}
