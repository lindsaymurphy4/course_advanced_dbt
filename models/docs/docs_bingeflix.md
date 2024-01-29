# Bingeflix Docs
This file contains doumentation for Bingeflix data sources.

## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix_column_user_id %}
The unique identifier of the Bingeflix user. A user is created when...
{% enddocs %}

## Subscriptions 
This section contains documentation from the Bingeflix Subscriptions table.

{% docs bingeflix_column_subscription_id %}
The unique identifier for the subscription.
{% enddocs %}

{% docs bingeflix_column_subscription_plan_id %}
The unique identifier of the subscription plan.
{% enddocs %}

{% docs bingeflix_column_subscription_starts_at %}
When the subscription started.
{% enddocs %}

{% docs bingeflix_column_subscription_ends_at %}
When the subscription ends. This value is NULL if the subscription is active.
{% enddocs %}
