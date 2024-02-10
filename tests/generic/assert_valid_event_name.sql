{% test assert_valid_event_name(model, column_name, like_clause) %}
-- Like clause must be an array
-- Any number of clauses can be added in the like_clause array

SELECT *
FROM {{ model }}

WHERE TRUE AND (
    {%- for clause in like_clause -%}
        {{ column_name }} LIKE '{{ clause }}'
        {% if not loop.last %} OR {% endif %}
    {% endfor %}
)

{% endtest %}
