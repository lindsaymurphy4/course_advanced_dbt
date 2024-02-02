# Bingeflix Docs
{% docs bingeflix_source %}
This source contains tables from the Bingeflix production database.
{% enddocs %}


## Users
{% docs bingeflix__users %}
This section contains documentation from the Bingeflix Users data source.
{% enddocs %}

### user_id
{% docs bingeflix__users__user_id %}
The unique identifier of the Bingeflix user. A user is created when an account in Bingeflix is created.
Each account is associated with a mutable email, and a unmutable user id.
{% enddocs %}

### created_at
{% docs bingeflix__users__created_at %}
It is the timestamp of when the user (account) is created.
At UTC timezone.
{% enddocs %}

### phone_number
{% docs bingeflix__users__phone_number %}
The user's phone number.
{% enddocs %}

### deleted_at
{% docs bingeflix__users__deleted_at%}
When the user's account was deleted (This is NULL if the account is not deleted.)
Empty string ('') should be considered as NULL as well.
{% enddocs %}

### username
{% docs bingeflix__users__username %}
The username used for login.
{% enddocs %}

### name
{% docs bingeflix__users__name %}
The user's full name.
{% enddocs %}

### sex
{% docs bingeflix__users__sex %}
The user's sex at birth.
{% enddocs %}

### email
{% docs bingeflix__users__email %}
The user's current email.
{% enddocs %}

### birthdate
{% docs bingeflix__users__birthdate %}
The user's birthdate.
{% enddocs %}

### region
{% docs bingeflix__users__region %}
The state or region the user resides in.
{% enddocs %}

### country
{% docs bingeflix__users__country %}
The country the user resides in.
{% enddocs %}



## Subscriptions
{% docs bingeflix__subscriptions %}
This section contains documentation from the Bingeflix subscriptions data source.
{% enddocs %}

### subscription_plan_id
As a foreign key the block bingeflix__subscription_plans__subscription_plan_id is used.

### user_id
As a foreign key, the block bingeflix__users__user_id is used.

### starts_at
{% docs bingeflix__subscriptions__starts_at %}
When the subscription plan started.
Timestamp at UTC.
{% enddocs %}

### ends_at
{% docs bingeflix__subscriptions__ends_at %}
When the subscription plan ends
(The value is NULL if the subscription plan has auto-renew turned on/does not have a defined end date.)
Timestamp at UTC.
{% enddocs %}

### subscription_id
{% docs bingeflix__subscriptions__subscription_id %}
The unique identifier of the subscription.
{% enddocs %}



## Subscription Plans
{% docs bingeflix__subscription_plans %}
This table contains information about the subscription plans available at Bingeflix.
{% enddocs %}

### subscription_plan_id
{% docs bingeflix__subscription_plans__subscription_plan_id %}
The unique identifier of the subscription plan.
{% enddocs %}

### plan_name
{% docs bingeflix__subscription_plans__plan_name %}
The name of the subscription plan.
{% enddocs %}

### pricing
{% docs bingeflix__subscription_plans__pricing %}
The price of the subscription plan per payment period in cents.
{% enddocs %}

### payment_period
{% docs bingeflix__subscription_plans__payment_period %}
The cadence of the payment period for the subscription plan (e.g., monthly, annually)
{% enddocs %}



## Events
{% docs bingeflix__events %}
This table contains information about the behavioral events of users while they interact with the Bingeflix platform.
It includes events such as logins, logouts, videos watched, and CTA/button clicks.
{% enddocs %}

### session_id
{% docs bingeflix__events__session_id %}
The unique identifier of the session in the Bingeflix application.
{% enddocs %}

### created_at
{% docs bingeflix__events__created_at %}
When the event was logged.
{% enddocs %}

### user_id
As a foreign key, the block bingeflix__users__user_id is used.

### event_name
{% docs bingeflix__events__event_name %}
The name of the event.
{% enddocs %}

### event_id
{% docs bingeflix__events__event_id %}
The unique identifier of the event
{% enddocs %}
