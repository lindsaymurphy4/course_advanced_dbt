{#
Purpose: Takes a list of strings and formats it for use in SQL WHERE IN (a, b, c) clause
Input: list of strings  -> ['a', 'b', 'c']
Output: string          -> 'a', 'b', 'c'
#}

{% macro list_to_where_in(l) %}
    '{{ l | join("'"",""'") }}'
{% endmacro %}