-- We have an issue with some test events appearing in our data source that we want to be notified about
-- This returns records where the event name contains 'test'

{% test assert_valid_event_name(model, column_name) %}

SELECT * FROM {{ model }}
WHERE lower({{ column_name }}) LIKE '%test%'

{% endtest %}
