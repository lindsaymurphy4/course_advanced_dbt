# Bingeflix Docs
This file contains doumentation for Bingeflix data sources.


## Events
This section contains documentation from the Bingeflix Events table.

{% docs bingeflix__events__table %}
This table contains information about the behavioral events of users while they interact with the Bingeflix platform. It includes events such as logins, logouts, videos watched, and CTA/button clicks.
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
{% enddocs %}


## Subscription Plans
This section contains documentation from the Bingeflix Subscription Plans table.

{% docs bingeflix__subscription_plans__table %}
This table contains information about various subscription plans available on Bingeflix.
{% enddocs %}

{% docs bingeflix__subscription_plans__column__subscription_plan_id %}
The unique identifier of the subscription plan.
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


## Subscriptions
This section contains documentation from the Bingeflix Subscriptions table.

{% docs bingeflix__subscriptions__table %}
This model contains information about Bingeflix subscriptions.
{% enddocs %}

{% docs bingeflix__subscriptions__column__starts_at %}
When the subscription started.
{% enddocs %}

{% docs bingeflix__subscriptions__column__ends_at %}
When the subscription ends. This value is NULL if the subscription is active.
{% enddocs %}

{% docs bingeflix__subscriptions__column__subscription_id %}
The unique identifier for the subscription.
{% enddocs %}

## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix__users__table %}
This table stores information about Bingeflix users, including user IDs, usernames, email addresses, subscription start dates, and other relevant user details.
{% enddocs %}

{% docs bingeflix__users__column__user_id %}
The unique identifier of the Bingeflix user. A user is created when...
{% enddocs %}

{% docs bingeflix__users__column__created_at %}
When the user was created.
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
Where the user resides (i.e. the state or province).
{% enddocs %}

{% docs bingeflix__users__column__country %}
Where the user resides.
{% enddocs %}