## rpt_mrr
{% docs rpt_mrr %}
This model contains calculations for the monthly recurring revenue generated per user and subscription for each month.
{% enddocs %}


### surrogate_key
{% docs rpt_mrr__surrogate_key %}
The primary key for the table. A concatenation of date_month, subscription_id and change_category hashed.
{% enddocs %}


### mrr_amount
{% docs rpt_mrr__mrr_amount %}
The amount of monthly recurring revenue generated from the subscription in a given month.
{% enddocs %}

### mrr_change
{% docs rpt_mrr__mrr_change %}
The change in monthly recurring revenue from the associated subscription versus last month.
{% enddocs %}

### retained_mrr_amount
{% docs rpt_mrr__retained_mrr_amount %}
The amount of monthly recurring revenue associated with the subscription retained from the previous month.
{% enddocs %}

### previous_month_mrr_amount
{% docs rpt_mrr__previous_month_mrr_amount %}
The amount of monthly recurring revenue associated with the subscription earned in the previous month.
{% enddocs %}

### change_category
{% docs rpt_mrr__change_category %}
The category the subscription falls into based on the current month (e.g. new, churned, retained, reactivated)
{% enddocs %}

### month_retained_number
{% docs rpt_mrr__month_retained_number %}
The number of months the subscription has been retained since it was started (first month = 0).
{% enddocs %}
