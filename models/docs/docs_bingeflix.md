# Bingeflix Docs
This file contains doumentation for Bingeflix data sources.

## Users
This section contains documentation for the Bingeflix Users table.

{% docs bingeflix_users_table %}
This table stores information about Bingeflix users, including user IDs, usernames, email addresses, subscription start dates, and other relevant user details.
{% enddocs %}

{% docs bingeflix_column_user_id %}
The unique identifier of the Bingeflix user.
{% enddocs %}

{% docs bingeflix_column_created_at %}
The timestamp indicating when the user's account was created.
{% enddocs %}

{% docs bingeflix_column_phone_number %}
The user's phone number.
{% enddocs %}

{% docs bingeflix_column_deleted_at %}
The timestamp indicating when the user's account was deleted. This is NULL if the account is not deleted.
{% enddocs %}

{% docs bingeflix_column_username %}
The username used for login.
{% enddocs %}

{% docs bingeflix_column_name %}
The user's full name.
{% enddocs %}

{% docs bingeflix_column_sex %}
The user's sex at birth.
{% enddocs %}

{% docs bingeflix_column_email %}
The user's email address.
{% enddocs %}

{% docs bingeflix_column_birthdate %}
The user's birthdate.
{% enddocs %}

{% docs bingeflix_column_region %}
The state or region where the user resides.
{% enddocs %}

{% docs bingeflix_column_country %}
The country where the user resides.
{% enddocs %}

## Subscriptions
This section contains documentation for the Bingeflix Subscriptions table.

{% docs bingeflix_subscriptions_table %}
This table contains subscription-related information, such as subscription plan IDs, subscription start dates, renewal dates, billing information, and any other relevant subscription details.
{% enddocs %}

{% docs bingeflix_column_subscription_plan_id %}
The unique identifier of the subscription plan.
{% enddocs %}

{% docs bingeflix_column_starts_at %}
The timestamp indicating when the subscription plan starts.
{% enddocs %}

{% docs bingeflix_column_ends_at %}
The timestamp indicating when the subscription plan ends. The value is NULL if the subscription plan has auto-renew turned on or does not have a defined end date.
{% enddocs %}

{% docs bingeflix_column_subscription_id %}
The unique identifier of the subscription.
{% enddocs %}

## Subscription Plans
This section contains documentation for the Bingeflix Subscription Plans table.

{% docs bingeflix_subscription_plans_table %}
This table contains information about the subscription plans available at Bingeflix.
{% enddocs %}

{% docs bingeflix_column_plan_name %}
The name of the subscription plan.
{% enddocs %}

{% docs bingeflix_column_pricing %}
The price of the subscription plan per payment period.
{% enddocs %}

{% docs bingeflix_column_payment_period %}
The cadence of the payment period for the subscription plan (e.g., monthly, annually).
{% enddocs %}

## Events
This section contains documentation for the Bingeflix Events table.

{% docs bingeflix_events_table %}
This table contains information about the behavioral events of users while they interact with the Bingeflix platform, such as logins, logouts, videos watched, and CTA/button clicks.
{% enddocs %}

{% docs bingeflix_column_session_id %}
The unique identifier of the session in the Bingeflix application.
{% enddocs %}

{% docs bingeflix_column_event_name %}
The name of the event.
{% enddocs %}

{% docs bingeflix_column_event_id %}
The unique identifier of the event.
{% enddocs %}

## Ads
This section contains documentation for the Bingeflix Ads table.

{% docs ads_platform_daily_ads_table %}
This table contains information about Bingeflix's marketing ads, including details such as the campaign identifier, spend, CPM, and CTR.
{% enddocs %}

{% docs bingeflix_column_date %}
The date when the ad campaign was served.
{% enddocs %}

{% docs bingeflix_column_campaign_id %}
The unique identifier of the ad campaign.
{% enddocs %}

{% docs bingeflix_column_spend %}
The amount spent on the ad campaign.
{% enddocs %}

{% docs bingeflix_column_cpm %}
The average cost per 1,000 impressions.
{% enddocs %}

{% docs bingeflix_column_ctr %}
The average click-through rate on ads served.
{% enddocs %}
