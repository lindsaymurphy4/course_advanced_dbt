# Bingeflix Docs
This file contains doumentation for Bingeflix data sources.

## ########################################################################
## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix__table__users %}
This is table contains information about Bingeflix users.
{% enddocs %}

{% docs bingeflix__users__column_user_id %}
The unique identifier of the Bingeflix user. A user is created when initiates a subscription.
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
This model contains information about Bingeflix subscriptions.
{% enddocs %}

{% docs bingeflix__subscriptions__column__subscription_plan_id %}
The unique identifier for the subscription plan.
Foreign Key.
{% enddocs %}

{% docs bingeflix__subscriptions__column__user_id %}
The unique identifier for the user.
Foreign Key.
{% enddocs %}

{% docs bingeflix__subscriptions__column__starts_at %}
When the subscription was started.
{% enddocs %}

{% docs bingeflix__subscriptions__column__ends_at %}
 When the subscription ends. This value is NULL if the subscription is active.
{% enddocs %}

{% docs bingeflix__subscriptions__column__subscription_id %}
The unique identifier for the subscription.
{% enddocs %}

## ########################################################################
## Subscription Plans
This section contains documentation from the Bingeflix Subscription Plans table.

## ########################################################################
## Events
This section contains documentation from the Bingeflix Events table.

## ########################################################################
## Ads
This section contains documentation from the Bingeflix Events table.
