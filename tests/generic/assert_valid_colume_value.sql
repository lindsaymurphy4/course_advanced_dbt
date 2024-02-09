{% test assert_valid_column_value(model, column_name, keyword) %}
/* Checks whether the target column contains the given keyword */

SELECT *
FROM {{ model }}
WHERE 
    CONTAINS(lower('{{ column_name }}'), lower('{{ keyword }}'))

{% endtest %}
