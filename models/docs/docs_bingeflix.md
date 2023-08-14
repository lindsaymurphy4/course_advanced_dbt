# Bingeflix Docs
This file contains docs blocks for Bingeflix sources and models.

## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix_user_id %}
The unique identifier of the Bingeflix user.
{% enddocs %}

{% docs user_created_at %}
When the user's account was created.
{% enddocs %}

{% docs phone_number %}
The user's phone number. PII.
{% enddocs %}

{% docs deleted_at %}
When the user's account was deleted (This is NULL if the account is not deleted.)
{% enddocs %}

{% docs username %}
The username used for login
{% enddocs %}

{% docs user_full_name %}
The user's full name. PII.
{% enddocs %}

{% docs user_sex %}
The user's sex at birth. PII.
{% enddocs %}

{% docs email %}
The user's email. PII.
{% enddocs %}

{% docs birthdate %}
The user's birthdate. PII.
{% enddocs %}

{% docs region %}
The state or region the user resides in (i.e. the state or province).
{% enddocs %}

{% docs country %}
The country the user resides in
{% enddocs %}

{% docs first_subscription_starts_at %}
The date when the user's first subscription started.
{% enddocs %}

{% docs count_of_subscriptions %}
The total number of subscriptions the user has or has had in the past.
{% enddocs %}

## Subscriptions

This section contains documentation about individual subscriptions. Note that users can have more than one subscription.

{% docs subscription_id %}
The unique identifier of the individual subscription (not to be confused with the subscription plan).
{% enddocs %}

{% docs starts_at %}
When the subscription plan starts, datetime.
{% enddocs %}

{% docs ends_at %}
When the subscription plan ends, datetime. The value is NULL if the subscription plan has auto-renew turned on, or if it does not have a defined end date.
{% enddocs %}

## Subscription plans

Documentation about the subscription plans available at Bingeflix.

{% docs subscription_plan_id %}
The unique identifier of the subscription plan.
{% enddocs %}

{% docs plan_name %}
The name of the subscription plan. Typically either 'Basic' or 'Standard with Ads'.
{% enddocs %}

{% docs pricing %}
The price of the subscription plan per payment period.
{% enddocs %}

{% docs payment_period %}
The cadence of the payment period for the subscription plan (e.g., monthly, annually). Expressed in words.
{% enddocs %}

## Events
This section contains documentation about user events.

{% docs session_id %}
The unique identifier of the session in the Bingeflix application.
{% enddocs %}

{% docs event_created_at %}
When the event was logged.
{% enddocs %}

{% docs event_name %}
The name of the event. Possible values:
- User Logged In
- User Logged Out
- Video Watched
- Page Viewed
- CTA Clicked
- Button Clicked
{% enddocs %}

{% docs event_id %}
The unique identifer for the event, integer.
{% enddocs %}

## Ads

This section contains documentation about ad campaigns.

{% docs campaign_date %}
When the ad campaign was served
{% enddocs %}

{% docs campaign_id %}
The unique identifier of the ad campaign
{% enddocs %}

{% docs campaign_spend %}
The amount spent on the ad campaign
{% enddocs %}

{% docs cpm %}
The average cost per 1,000 impressions
{% enddocs %}

{% docs ctr %}
The average click-through rate on ads served
{% enddocs %}
