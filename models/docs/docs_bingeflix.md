# Bingeflix Docs
This file contains documentation for Bingeflix data sources.


## Events
This section contains documentation from the Bingeflix Events table.

{% docs bingeflix_events_column_session_id %}
The unique identifier of the session in the Bingeflix application.
{% enddocs %}

{% docs bingeflix_events_column_created_at %}
When the event was logged.
{% enddocs %}

{% docs bingeflix_events_column_event_name %}
The name of the event.
{% enddocs %}

{% docs bingeflix_events_column_event_id %}
The unique identifier of the event.
{% enddocs %}


## Subscription_Plans
This section contains documentation from the Bingeflix Subscription_Plans table.

{% docs bingeflix_subscription_plans_column_subscription_plan_id %}
The unique identifier of the subscription plan.
{% enddocs %}

{% docs bingeflix_subscription_plans_column_plan_name %}
The name of the subscription plan.
{% enddocs %}

{% docs bingeflix_subscription_plans_column_pricing %}
The price of the subscription.
{% enddocs %}

{% docs bingeflix_subscription_plans_column_payment_period %}
The recurring payment period for the subscription.
{% enddocs %}


## Subscriptions
This section contains documentation from the Bingeflix Subscriptions table.

{% docs bingeflix_subscriptions_column_starts_at %}
When the subscription started.
{% enddocs %}

{% docs bingeflix_subscriptions_column_ends_at %}
When the subscription ends. This value is NULL if the subscription is active.
{% enddocs %}

{% docs bingeflix_subscriptions_column_subscription_id %}
The unique identifier for the subscription.
{% enddocs %}


## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix_users_column_user_id %}
The unique identifier of the Bingeflix user.
{% enddocs %}

{% docs bingeflix_users_column_created_at %}
When the user was created.
{% enddocs %}

{% docs bingeflix_users_column_phone_number %}
The user's phone number.
{% enddocs %}

{% docs bingeflix_users_column_deleted_at %}
When the user's account was deleted. The value is NULL if the account has not been deleted.
{% enddocs %}

{% docs bingeflix_users_column_username %}
The username for login to Bingeflix.
{% enddocs %}

{% docs bingeflix_users_column_name %}
The name of the user.
{% enddocs %}

{% docs bingeflix_users_column_sex %}
The user's sex at birth.
{% enddocs %}

{% docs bingeflix_users_column_email %}
The user's email address.
{% enddocs %}

{% docs bingeflix_users_column_birthdate %}
The user's birthdate.
{% enddocs %}

{% docs bingeflix_users_column_region %}
Where the user resides (i.e. the state or province).
{% enddocs %}

{% docs bingeflix_users_column_country %}
Where the user resides.
{% enddocs %}
