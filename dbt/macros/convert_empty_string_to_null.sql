
{% macro convert_empty_string_to_null(empty_column_name) %}

    NULLIF({{ empty_column_name }}, '')

{% endmacro %}
