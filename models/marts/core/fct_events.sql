{{ config(materialized='table') }}

{%- set columns = adapter.get_columns_in_relation(ref('stg_bingeflix__events')) -%}
{% set except_col_names=('EVENT_ID','CREATED_AT') %}
{% set col_type=('VARCHAR') %}

SELECT
    event_id,
    created_at,
    {%- for column in columns if column.name not in except_col_names and column.dtype in col_type %}
    {{ convert_empty_string_to_null (column.name)}}
    {%- if not loop.last %},{% endif -%}
    {% endfor %},

    {%- for column in columns if column.name not in except_col_names and column.dtype not in col_type %}
    {{ column.name }}
    {%- if not loop.last %},{% endif -%}
    {% endfor %}

FROM {{ ref('stg_bingeflix__events') }}
