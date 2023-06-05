{% set event_names = ["User Logged In", "User Logged Out", "Video Watched"] %}

SELECT
    session_id,
    {%- for event_name in event_names -%}
    SUM(CASE WHEN event_name = '{{event_name}}' THEN 1 ELSE 0 END) AS {{event_name|replace(" ", "_")|lower}}_present,
    {% endfor %}
    SUM(event_id) AS number
FROM {{ ref('stg_bingeflix_events') }}
GROUP BY session_id
