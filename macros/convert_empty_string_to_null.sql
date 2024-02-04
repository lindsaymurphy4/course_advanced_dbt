
{% macro convert_empty_string_to_null(empty_column_name) -%}

    NULLIF(NULLIF({{ empty_column_name }}, ''), ' ') as {{ empty_column_name }}

{%- endmacro %}
