{% macro get_subscription_end_month(start_month='start_month', end_month='end_month') %}

CASE
    -- For users that cancel in the first month, set their end_month to next month because the subscription remains active until the end of the first month
    WHEN {{start_month}} = {{end_month}} THEN  DATEADD('month', 1, {{end_month}})
    -- For users who haven't ended their subscription yet (end_month is NULL) set the end_month to one month from the current date (these rows will be removed from the final CTE)
    WHEN {{end_month}} IS NULL THEN DATE(DATEADD('month', 1, DATE_TRUNC('month', CURRENT_DATE)))
    ELSE {{end_month}}
END

{% endmacro %}
