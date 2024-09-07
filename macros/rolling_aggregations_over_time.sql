{% macro rolling_aggregations_over_time(
    column_name,
    aggregation_type=avg,
    time_window=7,
    partition_by=none,
    order_by='created_at') %}

    {{ aggregation_type }}( {{ column_name }} ) OVER (
        {% if partition_by is not none %}
            PARTITION BY {{ partition_by }}
        {% endif %}

        ORDER BY {{ order_by }}

        ROWS BETWEEN {{ time_window }} PRECEDING AND CURRENT ROW
    ) AS {{ aggregation_type }}_{{ time_window }}_periods_{{ column_name }}
{% endmacro %}
