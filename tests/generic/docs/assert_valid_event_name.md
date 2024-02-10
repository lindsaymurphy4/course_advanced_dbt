## Macro rolling_aggregation_n_periods
{% docs test__assert_valid_event_name %}
This test helps to validate if a string column (in its LOWER form) is like some defined clauses.
This test will failed if this is true for any row.

{% enddocs %}

### column_name
{% docs test__assert_valid_event_name__like_clause %}
It should be an array containing the different like clauses that you want to apply to the column_name column.
This test will fail if any of the like clauses in the array return a row.

{% enddocs %}
