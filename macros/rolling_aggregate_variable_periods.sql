{% macro rolling_aggregate_variable_periods(aggregation,column_name, partition_by, variable_period_day, order_by='created_at') %}
    {{ aggregation }} ( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ variable_period_day }} PRECEDING AND CURRENT ROW
            ) AS {{ aggregation }}_{{ variable_period_day }}_periods_{{ column_name }}
{% endmacro %}
