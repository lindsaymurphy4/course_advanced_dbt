# Bingeflix Docs
This file contains docs blocks for Bingeflix sources

## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix_user_id %}
The unique identifier of the Bingeflix user.
{% enddocs %}

{% docs bingeflix_subscription_plan_id %}
The unique identifier of the subscription plan
{% enddocs %}


{% docs bingeflix_created_at %}
When the user's account was created.
{% enddocs %}

{% docs bingeflix_phone_number %}
The user's phone number.
{% enddocs %}

{% docs bingeflix_deleted_at %}
When the user's account was deleted (This is NULL if the account is not deleted).
{% enddocs %}

{% docs bingeflix_username %}
The username used for login.
{% enddocs %}

{% docs bingeflix_name %}
The user's full name.
{% enddocs %}

{% docs bingeflix_sex %}
The user's sex at birth.
{% enddocs %}

{% docs bingeflix_email %}
The user's email.
{% enddocs %}

{% docs bingeflix_birthdate %}
The user's birthdate.
{% enddocs %}

{% docs bingeflix_region %}
The state or region the user resides in.
{% enddocs %}

{% docs bingeflix_country %}
The country the user resides in.
{% enddocs %}

{% docs bingeflix_user_id_subscriptions %}
The unique identifier of the user.
{% enddocs %}

{% docs bingeflix_starts_at %}
When the subscription plan starts.
{% enddocs %}

{% docs bingeflix_ends_at %}
When the subscription plan ends (The value is NULL if the subscription plan has auto-renew turned on/does not have a defined end date).
{% enddocs %}

{% docs bingeflix_subscription_id %}
The unique identifier of the subscription.
{% enddocs %}



{% docs bingeflix_plan_name %}
The name of the subscription plan.
{% enddocs %}

{% docs bingeflix_pricing %}
The price of the subscription plan per payment period.
{% enddocs %}

{% docs bingeflix_payment_period %}
The cadence of the payment period for the subscription plan (e.g., monthly, annually).
{% enddocs %}


{% docs bingeflix_session_id %}
The unique identifier of the session in the Bingeflix application.
{% enddocs %}

{% docs bingeflix_created_at_events %}
When the event was logged.
{% enddocs %}

{% docs bingeflix_user_id_events %}
The unique identifier of the user.
{% enddocs %}

{% docs bingeflix_event_name %}
The name of the event.
{% enddocs %}

{% docs bingeflix_event_id %}
The unique identifier of the event.
{% enddocs %}


{% docs bingeflix_date %}
When the ad campaign was served.
{% enddocs %}

{% docs bingeflix_campaign_id %}
The unique identifier of the ad campaign.
{% enddocs %}

{% docs bingeflix_spend %}
The amount spent on the ad campaign.
{% enddocs %}

{% docs bingeflix_cpm %}
The average cost per 1,000 impressions.
{% enddocs %}

{% docs bingeflix_ctr %}
The average click-through rate on ads served.
{% enddocs %}
