# Marts Docs
This file contains doumentation for Marts models.

## ########################################################################
## Core
This section contains documentation from the Core mart.

### Dim Users
{% docs marts__table__dim_users %}
This model contains information about Bingeflix users.
{% enddocs %}

{% docs marts__dim_users__column__current_age %}
The user's current age.
{% enddocs %}

{% docs marts__dim_users__column__age_at_acquisition %}
The age of the user when they became a Bingeflix user.
{% enddocs %}

### Dim Subscriptions
{% docs marts__table__dim_subscriptions %}
This model contains information about Bingeflix subscriptions.
{% enddocs %}

{% docs marts__dim_subscriptions__column__billing_period %}
The cadence of the billing period.
{% enddocs %}

### Fct Events
{% docs marts__table__fct_events %}
This table contains information about the behavioral events.
{% enddocs %}

## ########################################################################
## Finance
This section contains documentation from the Finance mart.

{% docs marts__finance__table__mrr %}
This model contains calculations for the monthly recurring revenue generated per user and subscription for each month.
{% enddocs %}

{% docs marts__finance__mrr__column__surrogate_key %}
The surrogate key. This acts as a primary key for this model.
{% enddocs %}

{% docs marts__finance__mrr__column__date_month %}
The calendar month.
{% enddocs %}

{% docs marts__finance__mrr__column__mrr_amount %}
The amount of monthly recurring revenue generated from the subscription in a given month.
{% enddocs %}

{% docs marts__finance__mrr__column__mrr_change %}
The change in monthly recurring revenue from the associated subscription versus last month.
{% enddocs %}

{% docs marts__finance__mrr__column__retained_mrr_amount %}
The amount of monthly recurring revenue associated with the subscription retained from the previous month.
{% enddocs %}

{% docs marts__finance__mrr__column__previous_month_mrr_amount %}
The amount of monthly recurring revenue associated with the subscription earned in the previous month.
{% enddocs %}

{% docs marts__finance__mrr__column__change_category %}
The category the subscription falls into based on the current month (e.g. new, churned, retained, reactivated)
{% enddocs %}

{% docs marts__finance__mrr__column__month_retained_number %}
The number of months the subscription has been retained since it was started (first month = 0).
{% enddocs %}

## ########################################################################
## Product
This section contains documentation from the Product mart.

{% docs bingeflix__table__users %}
{% enddocs %}

{% docs bingeflix__users__column__user_id %}
{% enddocs %}