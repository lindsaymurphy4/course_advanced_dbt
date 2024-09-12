{% test assert_valid_event_name(model, column_name) %}

SELECT *
FROM {{ model }}
WHERE lower({{ column_name }}) LIKE '%test%'

{% endtest %}
