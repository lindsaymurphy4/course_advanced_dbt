# Bingeflix Docs
This file contains doumentation for Bingeflix data sources.

## Users
This section contains documentation from the Bingeflix Users table.

{% docs user_id %}
The unique identifier of the Bingeflix user.
{% enddocs %}

## Subscriptions
This section contains documentation from the Bingeflix Subscription table.

{% docs subscription_id %}
The unique identifier of the subscription.
{% enddocs %}

{% docs subscription_plan_id %}
The subscription plan identifier.
{% enddocs %}

{% docs starts_at %}
When the subscription started.
{% enddocs %}

{% docs ends_at %}
When the subscription ends. This value is NULL if the subscription is active.
{% enddocs %}

{% docs plan_name %}
The name of the subscription plan.
{% enddocs %}

{% docs pricing %}
The monthly cost of the subscription.
{% enddocs %}

{% docs billing_period %}
The cadence of the billing period.
{% enddocs %}