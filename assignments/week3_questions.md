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

### Task 3: Write a unit test to verify the logic of a transformation
- Created a unit test named `test_age_at_acquisition` and ran. I also changed the way `dim_issue` calculates this (changing to ROUND rather than TRUNCATE) to test that failures are flagged.
- Added another unit test named `test_current_age` and ran. Whilst this is passing now I see the issue where in future it'll fail on the test users birthday. I wasn't able to get macros working within the unit tests so if anyone knows how to calculate this within the unit test itself, based on the current date, I'd be interested to know how.
- I tested various data formats between both tests (dict and csv) just to get an idea of how they're used.
