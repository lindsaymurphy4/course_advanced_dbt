
{% macro convert_to_null(empty_column_name) -%}

    CASE WHEN ({{ empty_column_name }} IN ('', 'null')) THEN NULL ELSE deleted_at END

{%- endmacro %}
