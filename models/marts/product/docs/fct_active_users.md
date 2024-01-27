## fct_active_users
{% docs fct_active_users %}
This model tracks which users have been active in each calendar week, and counts their total number of logins per week.
{% enddocs %}

### surrogate_key
{% docs fct_active_users__surrogate_key %}
The primary key for the table. A concatenation of date_week and user_id hashed.
{% enddocs %}

### login_count
{% docs fct_active_users__login_count %}
The total number of logins for a given user in a given week.
{% enddocs %}