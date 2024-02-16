{%- macro incremental_where_clause(column_name = 'created_at', lookback_window = 3, periods = 'days') -%}

{% if is_incremental() %}
AND {{ column_name }} > (SELECT MAX({{ column_name }}) FROM {{ this }}) - INTERVAL '{{ lookback_window }} {{ periods }}'
{% endif %}

{%- endmacro -%}
