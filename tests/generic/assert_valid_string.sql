{% test assert_valid_string(model, column_name, string) %}

SELECT *
FROM {{ model }}
WHERE LOWER({{ column_name }}) LIKE '{{ string }}'

{% endtest %}
