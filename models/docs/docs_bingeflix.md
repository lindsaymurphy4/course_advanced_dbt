# Bingeflix Docs
This file contains documentation for Bingeflix data sources.

## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix_column_user_id %}
The unique identifier of the Bingeflix user. A user is created when...
{% enddocs %}

{% docs bingeflix_column_user__created_at %}
When the user was created.
{% enddocs %}

{% docs bingeflix_column_event_id %}
The unique identifier of the event.
{% enddocs %}

{% docs bingeflix_column_event_name %}
The name of the event.
{% enddocs %}

{% docs bingeflix_column_event__created_at %}
When the event was logged.
{% enddocs %}

{% docs bingeflix_column_phone_number %}
The user's phone number.
{% enddocs %}

{% docs bingeflix_column_plan_id %}
The subscription plan identifier.
{% enddocs %}

{% docs bingeflix_column_plan_name %}
The name of the subscription plan.
{% enddocs %}

{% docs bingeflix_column_billing_period %}
The recurring payment period for the subscription.
{% enddocs %}

{% docs bingeflix_column_pricing %}
The price of the subscription per payment period.
{% enddocs %}

{% docs bingeflix_column_session_id %}
The unique identifier of the session in the Bingeflix application.
{% enddocs %}

{% docs bingeflix_column_subscription_id %}
The unique identifier of the subscription.
{% enddocs %}

{% docs bingeflix_column_subscription__starts_at %}
When the subscription started.
{% enddocs %}

{% docs bingeflix_column_subscription__ends_at %}
When the subscription ended. This value is NULL if the subscription has not had auto-renew turned off.
{% enddocs %}

{% docs bingeflix_column_username %}
The username for login to Bingeflix.
{% enddocs %}

