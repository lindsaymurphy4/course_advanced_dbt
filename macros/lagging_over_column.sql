{% macro lagging_over_column(
    column_name,
    partition_by_first_column,
    order_by,
    coalesce_value,
    new_name_column,
    partition_by_second_column=none) %}

    COALESCE(LAG( {{ column_name }} ) OVER (
        {% if partition_by_second_column is not none %}
            PARTITION BY {{ partition_by_first_column }}, {{ partition_by_second_column }}
        {% else %}
            PARTITION BY {{ partition_by_first_column }}
        {% endif %}

        ORDER BY {{ order_by }}), {{ coalesce_value }}
    ) AS  {{ new_name_column }}
{% endmacro %}
