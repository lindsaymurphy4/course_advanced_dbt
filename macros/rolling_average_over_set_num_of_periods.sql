{% macro rolling_average_over_set_number_of_periods(aggregation='avg', column_name='mrr', partition_by='mrr_with_changes.user_id', period="'YYYY-MM'", num=3, order_by='mrr_with_changes.date_month') %}
    {{ aggregation }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY TO_CHAR({{ order_by }}, {{ period }})
                ROWS BETWEEN {{ num }} PRECEDING AND CURRENT ROW
            ) AS {{ aggregation }}_{{ num }}_month_{{ column_name }}
{% endmacro %}
