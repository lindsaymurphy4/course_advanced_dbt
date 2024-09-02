# Bingeflix Docs
This file contains doumentation for Bingeflix data sources.

## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix_table_users %}
This is table contains information about Bingeflix users.
{% enddocs %}

{% docs bingeflix_column_user_id %}
The unique identifier of the Bingeflix user. A user is created when...
{% enddocs %}

{% docs bingeflix_column_username %}
The username for login to Bingeflix.
{% enddocs %}

## Product Analytics
This section contains documentation of the Bingeflix product engagement-related data

{% docs bingeflix_table_events %}
This table contains information about the behavioral events of users while they interact with the Bingeflix platform.
{% enddocs %}

{% docs bingeflix_column_session_id %}
The unique identifier of the session in the Bingeflix application.
{% enddocs %}

{% docs bingeflix_column_event_name %}
The name of the event (user interaction with Bingeflix app)
{% enddocs %}

{% docs bingeflix_column_event_id %}
The unique identifier of an event (a user interaction with Bingeflix app)
{% enddocs %}

## Finance
This section contains documentation of the Bingeflix financial data and metrics

{% docs bingeflix_table_subscriptions %}
This model contains information about Bingeflix subscriptions.
{% enddocs %}

{% docs bingeflix_table_subscription_plans %}
This table contains information about various subscription plans available on Bingeflix.
{% enddocs %}

{% docs bingeflix_column_plan_id %}
The unique identifier of the subscription plan.
{% enddocs %}

{% docs bingeflix_column_plan_name %}
The name of the subscription plan.
{% enddocs %}

{% docs bingeflix_column_pricing %}
The price of the subscription (in USD)
{% enddocs %}

{% docs bingeflix_column_payment_period %}
The recurring payment period for the subscription (e.g. "monthly")
{% enddocs %}

{% docs bingeflix_column_subscription_id %}
The unique identifier for the subscription.
{% enddocs %}

## Ads
This section contains documentation of the Bingeflix ad data.

{% docs bingeflix_table_daily_ads %}
The daily ad campaign performance and spend data by campaign
{% enddocs %}

{% docs bingeflix_column_campaign_id %}
The unique identifier for the campaign.
{% enddocs %}

{% docs bingeflix_column_cpm %}
The cost charged by the ads platform per thousand impressions.
{% enddocs %}

{% docs bingeflix_column_ctr %}
The click through rate on the campaign impressions.
{% enddocs %}



