# Metric Docs
This file contains documentation for metrics.

## Core
### Users
This section contains documentation about calculated fields or metrics from the dim_users table.

{% docs bingeflix_metrics_column_age_at_acquisition %}
The age of the user when they became a Bingeflix user.
{% enddocs %}

{% docs bingeflix_metrics_column_count_of_subscriptions %}
The number of subscriptions per user.
{% enddocs %}

{% docs bingeflix_metrics_column_current_age %}
The user's current age.
{% enddocs %}

{% docs bingeflix_metrics_column_first_subscription_starts_at %}
The first date of subscription.
{% enddocs %}

## Finance
### MRR
This section contains documentation about calculated fields or metrics from the MRR table.

{% docs bingeflix_mrr_table %}
This model contains calculations for the monthly recurring revenue generated per user and subscription for each month.
{% enddocs %}

{% docs bingeflix_metrics_column_change_category %}
The category the subscription falls into based on the current month (e.g. new, churned, retained, reactivated)
{% enddocs %}

{% docs bingeflix_metrics_column_month_retained_number %}
The number of months the subscription has been retained since it was started (first month = 0).
{% enddocs %}

{% docs bingeflix_metrics_column_mrr_amount %}
The amount of monthly recurring revenue generated from the subscription in a given month.
{% enddocs %}

{% docs bingeflix_metrics_column_mrr_change %}
The change in monthly recurring revenue from the associated subscription versus last month.
{% enddocs %}

{% docs bingeflix_metrics_column_mrr_surrogate_key %}
The surrogate key. This acts as a primary key for this model.
{% enddocs %}

{% docs bingeflix_metrics_column_previous_month_mrr_amount %}
The amount of monthly recurring revenue associated with the subscription earned in the previous month.
{% enddocs %}

{% docs bingeflix_metrics_column_retained_mrr_amount %}
The amount of monthly recurring revenue associated with the subscription retained from the previous month.
{% enddocs %}