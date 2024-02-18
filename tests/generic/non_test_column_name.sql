{% test non_test_event(model, column_name) %}

SELECT 
    *
FROM {{ model }}
WHERE lower({{ column_name }}) LIKE '%test%'

{% endtest %}