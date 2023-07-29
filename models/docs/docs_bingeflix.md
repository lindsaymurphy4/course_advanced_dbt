# Bingeflix Docs
This file contains docs blocks for Bingeflix data sources and data models.

## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix_user_id %}
The unique identifier of the Bingeflix user.
{% enddocs %}

{% docs user_created_at %}
When the user was created.
{% enddocs %}

{% docs user_phone_number %}
The user's phone number.
{% enddocs %}

{% docs user_deleted_at %}
When the user's account was deleted. The value is NULL if the account has not been deleted.
{% enddocs %}

{% docs user_username %}
When the user was created.
{% enddocs %}

{% docs user_name %}
The name of the user.
{% enddocs %}

{% docs user_sex %}
The user's sex at birth.
{% enddocs %}

{% docs user_email %}
The user's email address.
{% enddocs %}

{% docs user_birthdate %}
The user's birthdate.
{% enddocs %}

{% docs user_region %}
Where the user resides (i.e. the state or province).
{% enddocs %}

{% docs user_country %}
Where the user resides.
{% enddocs %}

## Events
This section contains documentation about the user events.

{% docs events_session_id %}
The unique identifier of the user session in the app.
{% enddocs %}

{% docs event_created_at %}
When the event was logged.
{% enddocs %}

{% docs event_name %}
The name of the event.
{% enddocs %}

{% docs event_id %}
The unique identifer for the event.
{% enddocs %}

## Subscriptions
This section contains the documentation about the subscriptions at Bingeflix.

{% docs subscription_plan_id %}
The subscription plan identifier.
{% enddocs %}

{% docs subscription_starts_at %}
When the subscription started.
{% enddocs %}

{% docs subscription_ends_at %}
When the subscription ends. This value is NULL if the subscription is active.
{% enddocs %}

{% docs subscription_id %}
The unique identifier for the subscription.
{% enddocs %}

## Subscription Plans
This section contains documentation about the subscription plans at Bingeflix. 

{% docs subscription_plan_name %}
The name of the subscription plan.
{% enddocs %}

{% docs subscription_plan_pricing %}
The price of the subscription plan.
{% enddocs %}

{% docs subscription_plan_payment_period %}
The recurring payment period for the subscription.
{% enddocs %}

## Daily Ads
This section cotains documentation about the advertising campaigns at Bingeflix.

{% docs campaign_date %}
The calendar date of the campaign reporting period.
{% enddocs %}

{% docs campaign_id %}
The unique identifier of the ad campaign.
{% enddocs %}

{% docs campaign_spend %}
The amount spent on the ad campaign.
{% enddocs %}

{% docs cpm %}
The cost charfed by the ad platform per 1,000 impressions.
{% enddocs %}

{% docs ctr %}
The click-through rate on the campaign impressions.
{% enddocs %}