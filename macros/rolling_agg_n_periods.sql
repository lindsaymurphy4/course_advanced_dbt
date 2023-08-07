{% macro rolling_agg_n_periods(agg, column_name, partition_by, order_by, n) %}
    {{ agg }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ n }} PRECEDING AND CURRENT ROW
            ) AS rolling_{{agg}}_{{ n }}_periods_{{ column_name }}
{% endmacro %}
