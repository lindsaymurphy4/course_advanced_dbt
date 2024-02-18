{%- macro incremental_lookback_window(column_name = 'created_at', lookback_window = -3, periods = 'day') -%}
/*
Add a where clause to an incremental load to accommodate late-arriving data.
*/
{% if is_incremental() %}

    WHERE {{ column_name }} >= (SELECT DATEADD('{{ periods }}' , {{ lookback_window }}, MAX( {{ column_name }} )) FROM {{ this }} )

{% endif %}

{%- endmacro -%}
