{%- test assert_column_string_value(model, column_name, value_string) %}

SELECT *
FROM {{ model }}
WHERE lower({{ column_name }}) LIKE '%{{ value_string }}%'

{%- endtest %}
