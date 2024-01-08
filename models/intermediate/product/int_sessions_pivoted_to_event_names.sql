{% set event_names = dbt_utils.get_column_values(table=ref('stg_bingeflix__events'), column='event_name') -%}

SELECT
    session_id,
    user_id,
    {% for event_name in event_names %}
    SUM(CASE WHEN event_name = '{{ event_name }}' THEN 1 ELSE 0 END) AS {{ event_name|replace(" ", "_")|lower }}_count
    {% if not loop.last %},{% endif -%}
    {% endfor %}
FROM
    {{ ref('stg_bingeflix__events') }}
GROUP BY
    session_id, user_id
