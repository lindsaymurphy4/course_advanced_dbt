# Bingeflix Docs
This file contains doumentation for Bingeflix data sources.

## Events
This section contains documentation from the Bingeflix Events table.

{% docs bingeflix_events_table %}
This table contains information about the behavioral events of users while they interact with the Bingeflix platform. It includes events such as logins, logouts, videos watched, and CTA/button clicks.
{% enddocs %}

{% docs bingeflix_events_column_created_at %}
When the event was logged
{% enddocs %}

{% docs bingeflix_events_column_event_id %}
The unique identifier of the event
{% enddocs %}

{% docs bingeflix_events_column_event_name %}
The name of the event
{% enddocs %}

{% docs bingeflix_events_column_user_id %}
The unique identifier of the user
{% enddocs %}

{% docs bingeflix_events_column_session_id %}
The unique identifier of the session in the Bingeflix application
{% enddocs %}

## Subscription Plans
This section contains documentation from the Bingeflix Subscription Plans table.

{% docs bingeflix_subscription_plans_table %}
This table contains information about the subscription plans available at Bingeflix.
{% enddocs %}

{% docs bingeflix_subscription_plans_column_payment_period %}
The cadence of the payment period for the subscription plan (e.g., monthly, annually)
{% enddocs %}

{% docs bingeflix_subscription_plans_column_plan_name %}
The name of the subscription plan
{% enddocs %}

{% docs bingeflix_subscription_plans_column_pricing %}
The price of the subscription plan per payment period
{% enddocs %}

{% docs bingeflix_subscription_plans_column_subscription_plan_id %}
The unique identifier of the subscription plan
{% enddocs %}

## Subscriptions
This section contains documentation from the Bingeflix Subscriptions table.

{% docs bingeflix_subscriptions_table %}
This table contains subscription-related information, such as subscription plan IDs, subscription start dates, renewal dates, billing information, and any other relevant subscription details.
{% enddocs %}

{% docs bingeflix_subscriptions_column_ends_at %}
When the subscription plan ends (The value is NULL if the subscription plan has auto-renew turned on/does not have a defined end date.)
{% enddocs %}

{% docs bingeflix_subscriptions_column_starts_at %}
When the subscription plan starts
{% enddocs %}

{% docs bingeflix_subscriptions_column_subscription_id %}
The unique identifier of the subscription
{% enddocs %}

{% docs bingeflix_subscriptions_column_user_id %}
The unique identifier of the user
{% enddocs %}

{% docs bingeflix_subscriptions_column_subscription_plan_id %}
The unique identifier of the subscription plan
{% enddocs %}

## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix_users_table %}
This table stores information about Bingeflix users, including user IDs, usernames, email addresses, subscription start dates, and other relevant user details.
{% enddocs %}

{% docs bingeflix_users_column_birthdatet %}
The user's birthdate
{% enddocs %}

{% docs bingeflix_users_column_country %}
The country the user resides in
{% enddocs %}

{% docs bingeflix_users_column_created_at %}
When the user's account was created
{% enddocs %}

{% docs bingeflix_users_column_deleted_at %}
When the user's account was deleted (This is NULL if the account is not deleted.)
{% enddocs %}

{% docs bingeflix_users_column_email %}
The user's email
{% enddocs %}

{% docs bingeflix_users_column_name %}
The user's full name
{% enddocs %}

{% docs bingeflix_users_column_phone_number %}
The user's phone number
{% enddocs %}

{% docs bingeflix_users_column_region %}
 The state or region the user resides in
{% enddocs %}

{% docs bingeflix_users_column_sex %}
The user's sex at birth
{% enddocs %}

{% docs bingeflix_users_column_username %}
The username used for login
{% enddocs %}

{% docs bingeflix_users_column_user_id %}
The unique identifier of the user
{% enddocs %}

