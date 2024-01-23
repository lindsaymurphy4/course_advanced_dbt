# Bingeflix Docs
This file contains doumentation for Bingeflix data sources.

## Users

{% docs bingeflix_users_table %}
This table stores information about Bingeflix users, including user IDs, usernames, email addresses, subscription start dates, and other relevant user details.
{% enddocs %}

{% docs bingeflix_user_id %}
The unique identifier of the user.
{% enddocs %}

{% docs bingeflix_users_created_at %}
When the user's account was created.
{% enddocs %}

{% docs bingeflix_users_phone_number %}
The user's phone number.
{% enddocs %}

{% docs bingeflix_users_deleted_at %}
When the user's account was deleted (This is NULL if the account is not deleted.).
{% enddocs %}

{% docs bingeflix_users_username %}
The username used for login.
{% enddocs %}

{% docs bingeflix_users_name %}
The user's full name.
{% enddocs %}

{% docs bingeflix_users_sex %}
The user's sex at birth.
{% enddocs %}

{% docs bingeflix_users_email %}
The user's email.
{% enddocs %}

{% docs bingeflix_users_birthdate %}
The user's birthdate.
{% enddocs %}

{% docs bingeflix_users_region %}
The state or region the user resides in.
{% enddocs %}

{% docs bingeflix_users_country %}
The country the user resides in.
{% enddocs %}

## Subscriptions

{% docs bingeflix_subscriptions_table %}
This table contains subscription-related information, such as subscription plan IDs, subscription start dates, renewal dates, billing information, and any other relevant subscription details.
{% enddocs %}

{% docs bingeflix_subscription_plan_id %}
The unique identifier of the subscription plan.
{% enddocs %}

{% docs bingeflix_subscriptions_starts_at %}
When the subscription plan starts.
{% enddocs %}

{% docs bingeflix_subscriptions_ends_at %}
When the subscription plan ends (The value is NULL if the subscription plan has auto-renew turned on/does not have a defined end date.).
{% enddocs %}

{% docs bingeflix_subscription_id %}
The unique identifier of the subscription.
{% enddocs %}

## Subscription Plans

{% docs bingeflix_subscription_plans_table %}
This table contains information about the subscription plans available at Bingeflix.
{% enddocs %}

{% docs bingeflix_subscription_plans_plan_name %}
The name of the subscription plan.
{% enddocs %}

{% docs bingeflix_subscription_plans_pricing %}
The price of the subscription plan per payment period.
{% enddocs %}

{% docs bingeflix_subscription_plans_payment_period %}
The cadence of the payment period for the subscription plan (e.g., monthly, annually).
{% enddocs %}

## Events

{% docs bingeflix_events_table %}
This table contains information about the behavioral events of users while they interact with the Bingeflix platform. It includes events such as logins, logouts, videos watched, and CTA/button clicks.
{% enddocs %}

{% docs bingeflix_events_session_id %}
The unique identifier of the session in the Bingeflix application.
{% enddocs %}

{% docs bingeflix_events_created_at %}
When the event was logged.
{% enddocs %}

{% docs bingeflix_events_event_name %}
The name of the event.
{% enddocs %}

{% docs bingeflix_events_event_id %}
The unique identifier of the event.
{% enddocs %}

## Ads

{% docs bingeflix_ads_table %}
This table contains information about Bingeflix's marketing ads.
{% enddocs %}

{% docs bingeflix_ads_date %}
When the ad campaign was served.
{% enddocs %}

{% docs bingeflix_ads_campaign_id %}
The unique identifier of the ad campaign.
{% enddocs %}

{% docs bingeflix_ads_spend %}
The amount spent on the ad campaign.
{% enddocs %}

{% docs bingeflix_ads_cpm %}
The average cost per 1,000 impressions.
{% enddocs %}

{% docs bingeflix_ads_ctr %}
The average click-through rate on ads served.
{% enddocs %}
