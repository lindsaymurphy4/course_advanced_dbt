# Bingeflix Docs
This file contains docs blocks for Bingeflix sources

## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix_user_id %}
The unique identifier of the Bingeflix user.
{% enddocs %}

-- Added by prabhu
{% docs bingeflix_created_at %}
When the user was created.
{% enddocs %}

{% docs bingeflix_phone_number %}
The user's phone number.
{% enddocs %}

{% docs bingeflix_deleted_at %}
When the user's account was deleted. The value is NULL if the account has not been deleted.
{% enddocs %}

{% docs bingeflix_username %}
The username for login to Bingeflix.
{% enddocs %}

{% docs bingeflix_name %}
The name of the user.
{% enddocs %}

{% docs bingeflix_sex %}
The user's sex at birth.
{% enddocs %}

{% docs bingeflix_email %}
The user's email address.
{% enddocs %}

{% docs bingeflix_birthdate %}
The user's birthdate.
{% enddocs %}

{% docs bingeflix_region %}
Where the user resides (i.e. the state or province).
{% enddocs %}

{% docs bingeflix_country %}
Where the user resides.
{% enddocs %}

## Subscriptions

{% docs bingeflix_subscription_starts_at %}
When the subscription started.
{% enddocs %}

{% docs bingeflix_subscription_ends_at %}
When the subscription ends. This value is NULL if the subscription is active.
{% enddocs %}

{% docs bingeflix_subscription_id %}
The unique identifier for the subscription.
{% enddocs %}

## Subscription Plans

{% docs bingeflix_subscription_plan_id %}
 The unique identifier of the subscription plan.
{% enddocs %}

{% docs bingeflix_subscription_plan_name %}
The name of the subscription plan.
{% enddocs %}

{% docs bingeflix_subscription_plan_pricing %}
The price of the subscription plan per payment period.
{% enddocs %}

{% docs bingeflix_subscription_plan_payment_period %}
The cadence of the payment period for the subscription plan (e.g., monthly, annually)
{% enddocs %}

## Events

{% docs bingeflix_events_session_id %}
The unique identifier of the session in the Bingeflix application.
{% enddocs %}

{% docs bingeflix_events_created_at %}
 When the event was logged.
{% enddocs %}

{% docs bingeflix_events_user_id %}
The unique identifier of the user.
{% enddocs %}

{% docs bingeflix_events_event_name %}
The name of the event.
{% enddocs %}

{% docs bingeflix_events_event_id %}
The unique identifier of the event.
{% enddocs %}