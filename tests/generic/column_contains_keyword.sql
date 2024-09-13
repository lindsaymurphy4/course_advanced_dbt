{% test column_contains_keyword(model, column_name, keyword) %}
  SELECT *
  FROM {{ model }}
  WHERE lower({{ column_name }}) LIKE '%{{ keyword | lower }}%'
{% endtest %}
