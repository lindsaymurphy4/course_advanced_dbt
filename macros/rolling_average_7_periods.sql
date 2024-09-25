{% macro rolling_operation_over_periods(column_name, partition_by, operation="avg", periods=7, order_by='created_at') %}
    {{operation}} ( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{periods - 1}} PRECEDING AND CURRENT ROW
            ) AS {{operation}}_{{periods}}_periods_{{ column_name }}
{%- endmacro -%}
