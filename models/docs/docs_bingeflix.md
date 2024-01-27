# Bingeflix Docs
This file contains doumentation for Bingeflix data sources.

## Events
This section contains documentation from the Bingeflix Events table.

{% docs bingeflix_events_table %}
This table contains information about the behavioral events of users while they interact with the Bingeflix platform. It includes events such as logins, logouts, videos watched, and CTA/button clicks.
{% enddocs %}

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


## Subscription Plans
This section contains documentation from the Bingeflix Subscription Plans table.

{% docs bingeflix_subscription_plans_table %}
This table contains information about various subscription plans available on Bingeflix.
{% enddocs %}

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


## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix_users_table %}
This table stores information about Bingeflix users, including user IDs, usernames, email addresses, subscription start dates, and other relevant user details.
{% enddocs %}

{% docs bingeflix_users_column_user_id %}
The unique identifier of the Bingeflix user. A user is created when...
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