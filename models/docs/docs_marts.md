# Marts Docs
This file contains doumentation for Marts models.

## ########################################################################
## Core
This section contains documentation from the Core mart.

### Dim Users
{% docs marts__core__table__dim_users %}
This model contains information about Bingeflix users.
{% enddocs %}

{% docs marts__core__dim_users__column__current_age %}
The user's current age.
{% enddocs %}

{% docs marts__core__dim_users__column__age_at_acquisition %}
The age of the user when they became a Bingeflix user.
{% enddocs %}

{% docs bingeflix__users__column__first_subscription_starts_at %}
The date the user's first subscription began.
{% enddocs %}

{% docs bingeflix__users__column__count_of_subscriptions %}
The number of subscriptions the user has acquired.
{% enddocs %}

### Dim Subscriptions
{% docs marts__core__table__dim_subscriptions %}
This model contains information about Bingeflix subscriptions.
{% enddocs %}

{% docs marts__core__dim_subscriptions__column__billing_period %}
The cadence of the billing period.
{% enddocs %}

### Fct Events
{% docs marts__core__table__fct_events %}
This table contains information about the behavioral events.
{% enddocs %}

## ########################################################################
## Finance
This section contains documentation from the Finance mart.

{% docs marts__finance__table__fct_mrr %}
This model contains calculations for the monthly recurring revenue generated per user and subscription for each month.
{% enddocs %}

{% docs marts__finance__fct_mrr__column__surrogate_key %}
The surrogate key. This acts as a primary key for this model.
{% enddocs %}

{% docs marts__finance__fct_mrr__column__mrr_amount %}
The amount of monthly recurring revenue generated from the subscription in a given month.
{% enddocs %}

{% docs marts__finance__fct_mrr__column__mrr_change %}
The change in monthly recurring revenue from the associated subscription versus last month.
{% enddocs %}

{% docs marts__finance__fct_mrr__column__retained_mrr_amount %}
The amount of monthly recurring revenue associated with the subscription retained from the previous month.
{% enddocs %}

{% docs marts__finance__fct_mrr__column__previous_month_mrr_amount %}
The amount of monthly recurring revenue associated with the subscription earned in the previous month.
{% enddocs %}

{% docs marts__finance__fct_mrr__column__change_category %}
The category the subscription falls into based on the current month (e.g. new, churned, retained, reactivated)
{% enddocs %}

{% docs marts__finance__fct_mrr__column__month_retained_number %}
The number of months the subscription has been retained since it was started (first month = 0).
{% enddocs %}

## ########################################################################
## Product
This section contains documentation from the Product mart.

{% docs marts__product__table__fct_active_users %}
This model tracks which users have been active in each calendar week, and counts their total number of logins per week.
{% enddocs %}

{% docs marts__prodict__fct_active_users__column__surrogate_key %}
A concatenation of date_week and user_id hashed.
Primary Key.
{% enddocs %}

{% docs marts__prodict__fct_active_users__column__login_count %}
The total number of logins for a given user in a given week.
{% enddocs %}

{% docs marts__prodict__fct_active_users__column__sum_4_periods_login_count %}
The total login count over the last 4 weeks.
{% enddocs %}

{% docs marts__prodict__fct_active_users__column__avg_7_periods_login_count %}
The average login count for the last 7 weeks.
{% enddocs %}
