{%- macro incremental_where_clause(column_name = 'created_at', lookback_window = -3) -%}

    WHERE {{ column_name }} >= (SELECT DATEADD('day' , {{ lookback_window }}, MAX( {{ column_name }} )) FROM {{ this }} )

{%- endmacro -%}
