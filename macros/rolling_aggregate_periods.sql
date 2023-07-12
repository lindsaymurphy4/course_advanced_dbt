-- TODO: Remove from Bingeflix repo
{% macro rolling_aggregate_periods(column_name, partition_by, agg_type = 'AVG', num_periods = 7 , order_by = 'created_at') %}
    {{ agg_type }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
            ) AS {{ agg_type }}_{{ num_period }}_periods_{{ column_name }}
{% endmacro %}
