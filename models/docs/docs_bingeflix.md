# Bingeflix Docs
This file contains doumentation for Bingeflix data sources.

## Events
This section contains documentation from the Bingeflix Events table.

{% docs bingeflix_table_events %}
This table contains information about the behavioral events of users while they interact with the Bingeflix platform.
{% enddocs %}

{% docs bingeflix_column_session_id %}
The unique identifier of the session in the Bingeflix application.
{% enddocs %}

{% docs bingeflix_column_event_created_at %}
When the event was logged.
{% enddocs %}

{% docs bingeflix_column_event_id %}
The unique identifier of the event.
{% enddocs %}

{% docs bingeflix_column_event_name %}
The name of the event.
{% enddocs %}

## Subscription Plans
This section contains documentation from the Bingeflix Subscription Plans table.

{% docs bingeflix_table_subscription_plans %}
This table contains information about various subscription plans available on Bingeflix.
{% enddocs %}

{% docs bingeflix_column_subscription_plan_id %}
The unique identifier of the subscription plan.
{% enddocs %}

{% docs bingeflix_column_plan_name %}
The name of the subscription plan.
{% enddocs %}

{% docs bingeflix_column_pricing %}
The price of the subscription.
{% enddocs %}

{% docs bingeflix_column_payment_period %}
The recurring payment period for the subscription.
{% enddocs %}

## Subscriptions

{% docs bingeflix_table_subscriptions %}
This model contains information about Bingeflix subscriptions.
{% enddocs %}

{% docs bingeflix_column_starts_at %}
The recurring payment period for the subscription.
{% enddocs %}

{% docs bingeflix_column_ends_at %}
The recurring payment period for the subscription.
{% enddocs %}

{% docs bingeflix_column_subscription_id %}
The recurring payment period for the subscription.
{% enddocs %}

## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix_table_users %}
This is table contains information about Bingeflix users.
{% enddocs %}

{% docs bingeflix_column_user_id %}
The unique identifier of the Bingeflix user. A user is created when...
{% enddocs %}

{% docs bingeflix_column_user_created_at %}
When the user was created.
{% enddocs %}

{% docs bingeflix_column_phone_number %}
The user's phone number.
{% enddocs %}

{% docs bingeflix_column_deleted_at %}
When the user's account was deleted. The value is NULL if the account has not been deleted.
{% enddocs %}

{% docs bingeflix_column_username %}
The username for login to Bingeflix.
{% enddocs %}

{% docs bingeflix_column_name %}
The name of the user.
{% enddocs %}

{% docs bingeflix_column_sex %}
The user's sex at birth.
{% enddocs %}

{% docs bingeflix_column_email %}
The user's email address.
{% enddocs %}

{% docs bingeflix_column_birthdate %}
TThe user's birthdate.
{% enddocs %}

{% docs bingeflix_column_region %}
Where the user resides (i.e. the state or province).
{% enddocs %}

{% docs bingeflix_column_country %}
Where the user resides.
{% enddocs %}
