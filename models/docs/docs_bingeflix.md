# Bingeflix Docs
This file contains doumentation for Bingeflix data sources.

## Common Fields
This section contains documentation of commonly used fields throughout
all Bingefix source tables.

{% docs bingeflix_column_created_at %}
When the event was logged.
{% enddocs %}

## Events
This section contains documentation from the Bingeflix Events table.

{% docs bingeflix_column_event_id %}
The unique identifier of the event.
{% enddocs %}

{% docs bingeflix_column_event_name %}
The name of the event.
{% enddocs %}

{% docs bingeflix_column_session_id %}
The unique identifier of the session in the Bingeflix application.
{% enddocs %}

## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix_column_birthdate %}
The user's birthdate.
{% enddocs %}

{% docs bingeflix_column_country %}
Where the user resides.
{% enddocs %}

{% docs bingeflix_column_deleted_at %}
When the user's account was deleted. The value is NULL if the account has not been deleted.
{% enddocs %}

{% docs bingeflix_column_email %}
The user's email address.
{% enddocs %}

{% docs bingeflix_column_name %}
The name of the user.
{% enddocs %}

{% docs bingeflix_column_phone_number %}
The user's phone number.
{% enddocs %}

{% docs bingeflix_column_region %}
Where the user resides (i.e. the state or province).
{% enddocs %}

{% docs bingeflix_column_sex %}
The user's sex at birth.
{% enddocs %}

{% docs bingeflix_column_user_id %}
The unique identifier of the Bingeflix user. A user is created when...
{% enddocs %}

{% docs bingeflix_column_username %}
The username for login to Bingeflix.
{% enddocs %}