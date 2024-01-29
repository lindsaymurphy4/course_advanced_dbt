# Bingeflix Docs
This file contains doumentation for Bingeflix data sources.

## ########################################################################
## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix__table__users %}
This is table contains information about Bingeflix users.
{% enddocs %}

{% docs bingeflix__users__column__user_id %}
The unique identifier of the Bingeflix user. A user is created when initiates a subscription.
Primary Key.
{% enddocs %}

{% docs bingeflix__users__column__created_at%}
When the user's account was created.
{% enddocs %}

{% docs bingeflix__users__column__phone_number %}
The user's phone number.
{% enddocs %}

{% docs bingeflix__users__column__deleted_at %}
When the user's account was deleted. The value is NULL if the account has not been deleted.
{% enddocs %}

{% docs bingeflix__users__column__username %}
The username for login to Bingeflix.
{% enddocs %}

{% docs bingeflix__users__column__name %}
The name of the user.
{% enddocs %}

{% docs bingeflix__users__column__sex %}
The user's sex at birth.
{% enddocs %}

{% docs bingeflix__users__column__email %}
The user's email address.
{% enddocs %}

{% docs bingeflix__users__column__birthdate %}
The user's birthdate.
{% enddocs %}

{% docs bingeflix__users__column__region %}
The state or region of the user's residence.
{% enddocs %}

{% docs bingeflix__users__column__country %}
The country of the user's residence.
{% enddocs %}

## ########################################################################
## Subscriptions
This section contains documentation from the Bingeflix Subscriptions table.

{% docs bingeflix__table__subscriptions %}
This table contains subscription-related information, such as subscription plan IDs, subscription start dates, renewal dates, billing information, and any other relevant subscription details.
{% enddocs %}

{% docs bingeflix__subscriptions__column__subscription_id %}
When the subscription was started.
{% enddocs %}

{% docs bingeflix__subscriptions__column__starts_at %}
When the subscription plan ends (The value is NULL if the subscription plan has auto-renew turned on/does not have a defined end date).
{% enddocs %}


{% docs bingeflix__subscriptions__column__ends_at %}
When the subscription was started.
{% enddocs %}


## ########################################################################
## Subscription Plans
This table contains information about various subscription plans available on Bingeflix.

{% docs bingeflix__table__subscription_plans %}
This model contains information about Bingeflix subscriptions.
{% enddocs %}

{% docs bingeflix__subscription_plans__column__subscription_plan_id %}
The unique identifier for the subscription plan.
Primary Key.
{% enddocs %}

{% docs bingeflix__subscription_plans__column__plan_name %}
The name of the subscription plan.
{% enddocs %}

{% docs bingeflix__subscription_plans__column__pricing %}
The price of the subscription.
{% enddocs %}

{% docs bingeflix__subscription_plans__column__payment_period %}
The recurring payment period for the subscription.
{% enddocs %}

## ########################################################################
## Events
This section contains documentation from the Bingeflix Events table.

{% docs bingeflix__table__events %}
This model contains information about Bingeflix subscriptions.
{% enddocs %}

{% docs bingeflix__events__column__session_id %}
The unique identifier of the session in the Bingeflix application.
{% enddocs %}

{% docs bingeflix__events__column__created_at %}
When the event was logged.
{% enddocs %}

{% docs bingeflix__events__column__event_name %}
The name of the event.
{% enddocs %}

{% docs bingeflix__events__column__event_id %}
The unique identifier of the event.
Primary Key.
{% enddocs %}
