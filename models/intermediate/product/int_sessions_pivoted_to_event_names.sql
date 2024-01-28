{% set event_names = dbt_utils.get_column_values(table=ref('stg_bingeflix__events'), column='event_name') -%}

SELECT
    session_id,
    user_id,
    {% for event_name in event_names %}
    sum(case when event_name = '{{ event_name }}' then 1 else 0 end) as {{ event_name|replace(" ", "_")|lower }}_count
    {% if not loop.last %},{% endif -%}
    {% endfor %}
from
    {{ ref('stg_bingeflix__events') }}
group by
    session_id, user_id
