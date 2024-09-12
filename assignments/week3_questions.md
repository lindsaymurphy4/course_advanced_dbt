# Week 3 Questions

### Task 1: Identify a few redundant tests that can be removed
- Removed all `not_null` checks from all columns in `dim_users` that are not calculated/derived as these are already checked in `stg_bingeflix__users`.
- Removed `accepted_values` check from `subscription_plan_id` on `dim_subscriptions` as this is already checked in `stg_bingeflix__subscription_plans`.
- Updated `README.md` to reflect the redundancy with the `not_null` checks.
- Updated `README.md` to reflect the redundancy with the  `accepted_values` checks.
- Updated `README.md` to remove boolean conventions as we don't have any columns with the boolean type.

### Task 2: Write a custom generic test to replace a redundant singular test
- Created the following generic test named "assert_valid_event_name":
```
{% test assert_column_is_positive(model, column_name) %}

SELECT *
FROM {{ model }}
WHERE {{ column_name }} <= 0

{% endtest %}
```
- Applied the test to `stg_bingeflix__events.sql`.
