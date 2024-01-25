# Intermediate Docs
This file contains doumentation for intermediate models.

## ########################################################################
## Product
This section contains documentation from the intermediate models for Product.

### Int Sessions Pivoted To Event Names
{% docs int__product__table__int_sessions_pivoted_to_event_names %}
This is an intermediate model that counts the total number of events tracked per session_id.
{% enddocs %}

{% docs int__product__int_sessions_pivoted_to_event_names__column__user_logged_in_count %}
The number of times the user logged in during the specified session.
{% enddocs %}

{% docs int__product__int_sessions_pivoted_to_event_names__column__user_logged_out_count %}
The number of times the user logged out during the specified session.
{% enddocs %}

{% docs int__product__int_sessions_pivoted_to_event_names__column__video_watched_count %}
The number of times the user watched videos during the specified session.
{% enddocs %}

## ########################################################################
## Dates
This section contains documentation from the intermediate models for Dates.

### Int Dates
{% docs int__table__int_dates %}
This is a calendar table including all the consecutive dates between the 2019-01-01 and 2030-01-01.

It also includes week, month, quarter, year, and other values associated with a specific date.

{% enddocs %}

{% docs int__int_dates__column__calendar_date %}
The calendar date.
{% enddocs %}

{% docs int__int_dates__column__date_week %}
The start date of the calendar week (week starting on Monday).
{% enddocs %}

{% docs int__int_dates__column__date_month %}
The first date of the calendar month.
{% enddocs %}

{% docs int__int_dates__column__date_quarter %}
The first date of the calendar quarter.
{% enddocs %}

{% docs int__int_dates__column__date_year %}
The first date of the calendar year.
{% enddocs %}

{% docs int__int_dates__column__day_of_month %}
The day of the month.
{% enddocs %}

{% docs int__int_dates__column__year_num %}
The year number (e.g. 2018).
{% enddocs %}

{% docs int__int_dates__column__quarter_num %}
The quarter number (between 1 and 4).
{% enddocs %}

{% docs int__int_dates__column__month_num %}
The month number (between 1 and 12).
{% enddocs %}