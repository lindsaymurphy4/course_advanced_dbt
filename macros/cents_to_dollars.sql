{% macro cents_to_dollars(column_name) %}
    ({{ column_name }} / 100.0)::DECIMAL(18, 2)
{% endmacro %}
