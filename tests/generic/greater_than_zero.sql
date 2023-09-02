{% test greater_than_zero(model, column_name) %}

SELECT
    *
FROM {{ model }}
WHERE {{ column_name }} <= 0

{% endtest %}