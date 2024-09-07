{% macro aggregate_over_period(agg_function='avg', n_rows=7, periods='days', column_name='', partition_by='surrogate_key', order_by='date') %}
    {{agg_function}}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{n_rows}} PRECEDING AND CURRENT ROW
            ) AS {{agg_function}}_{{n_rows}}_{{periods}}_{{ column_name }}
{% endmacro %}
