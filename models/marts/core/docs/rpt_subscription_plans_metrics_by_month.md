## rpt_subscription_plans_metrics_by_month
{% docs rpt_subscription_plans_metrics_by_month %}
This model computes some basic monthly metrics based on subscription plans.

{% enddocs %}

### surrogate_key
{% docs rpt_subscription_plans_metrics_by_month__surrogate_key %}
The primary key for the table. A concatenation of plan_name and start_month hashed.

{% enddocs %}

### start_month
{% docs rpt_subscription_plans_metrics_by_month__start_month %}
Date in the format yyyy-mm-dd representing the month in which the plan_name started.

{% enddocs %}

### total_subscription_per_month
{% docs rpt_subscription_plans_metrics_by_month__total_subscription_per_month %}
The total amount of subscriptions that started in start_month regarding plan_name subscriptions.

{% enddocs %}

### avg_3_periods_total_subscription_per_month
{% docs rpt_subscription_plans_metrics_by_month__avg_3_periods_total_subscription_per_month %}
The average of total subscriptions for a specific subscription plan in the last 3 months in dollars.

{% enddocs %}

### sum_3_periods_total_subscription_per_month
{% docs rpt_subscription_plans_metrics_by_month__sum_3_periods_total_subscription_per_month %}
The sum of total subscriptions for a specific subscription plan in the last 3 months in dollars.

{% enddocs %}
