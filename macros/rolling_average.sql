{% macro rolling_average(column_names, partition_by, time_unit='days', n_periods=7, order_by='created_at') %}
    {% set n = n_periods - 1 %}
    {% for column_name in column_names %}
        avg({{ column_name }}) OVER (
            PARTITION BY {{ partition_by }}
            ORDER BY {{ order_by }}
            ROWS BETWEEN {{ n }} PRECEDING AND 0 PRECEDING
        ) AS avg_{{ n_periods }}_{{ time_unit }}_{{ column_name }}{{ ',' if not loop.last }}
    {% endfor %}
{% endmacro %}
