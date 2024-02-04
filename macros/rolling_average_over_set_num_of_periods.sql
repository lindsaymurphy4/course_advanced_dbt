{% macro rolling_average_over_set_number_of_periods(column_name, partition_by, order_by, aggregation='avg', period="'YYYY-MM'", num=3) %}
    {{ aggregation }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY TO_CHAR({{ order_by }}, {{ period }})
                ROWS BETWEEN {{ num - 1 }} PRECEDING AND CURRENT ROW
            ) AS {{ aggregation }}_{{ num }}_month_{{ column_name }}
{% endmacro %}
