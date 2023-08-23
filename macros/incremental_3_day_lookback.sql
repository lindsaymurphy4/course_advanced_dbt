{%- macro incremental_3_day_lookback(column_name = 'created_at', lookback_window = -3, periods = 'day') -%}

WHERE {{ column_name }} >= (SELECT DATEADD('{{ periods }}' , {{ lookback_window }}, max( {{ column_name }} )) from {{ this }})

{%- endmacro -%}
