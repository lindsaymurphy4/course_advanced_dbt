SELECT
    calendar_date AS date_month
FROM
    {{ ref('int_dates') }}
WHERE
    day_of_month = 1
