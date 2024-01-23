# Bingeflix Docs
This file contains doumentation for Bingeflix data sources.

## Users

{% docs table_users %}
This table stores information about Bingeflix users, including user IDs, usernames, email addresses, subscription start dates, and other relevant user details.
{% enddocs %}

{% docs user_id %}
The unique identifier of the user.
{% enddocs %}

{% docs users_created_at %}
When the user's account was created.
{% enddocs %}

{% docs users_phone_number %}
The user's phone number.
{% enddocs %}

{% docs users_deleted_at %}
When the user's account was deleted (This is NULL if the account is not deleted.).
{% enddocs %}

{% docs users_username %}
The username used for login.
{% enddocs %}

{% docs users_name %}
The user's full name.
{% enddocs %}

{% docs users_sex %}
The user's sex at birth.
{% enddocs %}

{% docs users_email %}
The user's email.
{% enddocs %}

{% docs users_birthdate %}
The user's birthdate.
{% enddocs %}

{% docs users_region %}
The state or region the user resides in.
{% enddocs %}

{% docs users_country %}
The country the user resides in.
{% enddocs %}

## Subscriptions

{% docs table_subscriptions %}
This table contains subscription-related information, such as subscription plan IDs, subscription start dates, renewal dates, billing information, and any other relevant subscription details.
{% enddocs %}

{% docs subscription_plan_id %}
The unique identifier of the subscription plan.
{% enddocs %}

{% docs subscriptions_starts_at %}
When the subscription plan starts.
{% enddocs %}

{% docs subscriptions_ends_at %}
When the subscription plan ends (The value is NULL if the subscription plan has auto-renew turned on/does not have a defined end date.).
{% enddocs %}

{% docs subscription_id %}
The unique identifier of the subscription.
{% enddocs %}

## Subscription Plans

{% docs table_subscription_plans %}
This table contains information about the subscription plans available at Bingeflix.
{% enddocs %}

{% docs subscription_plans_plan_name %}
The name of the subscription plan.
{% enddocs %}

{% docs subscription_plans_pricing %}
The price of the subscription plan per payment period.
{% enddocs %}

{% docs subscription_plans_payment_period %}
The cadence of the payment period for the subscription plan (e.g., monthly, annually).
{% enddocs %}

## Events

{% docs table_events %}
This table contains information about the behavioral events of users while they interact with the Bingeflix platform. It includes events such as logins, logouts, videos watched, and CTA/button clicks.
{% enddocs %}

{% docs events_session_id %}
The unique identifier of the session in the Bingeflix application.
{% enddocs %}

{% docs events_created_at %}
When the event was logged.
{% enddocs %}

{% docs events_event_name %}
The name of the event.
{% enddocs %}

{% docs events_event_id %}
The unique identifier of the event.
{% enddocs %}

## Ads

{% docs table_ads %}
This table contains information about Bingeflix's marketing ads.
{% enddocs %}

{% docs ads_date %}
When the ad campaign was served.
{% enddocs %}

{% docs ads_campaign_id %}
The unique identifier of the ad campaign.
{% enddocs %}

{% docs ads_spend %}
The amount spent on the ad campaign.
{% enddocs %}

{% docs ads_cpm %}
The average cost per 1,000 impressions.
{% enddocs %}

{% docs ads_ctr %}
The average click-through rate on ads served.
{% enddocs %}
