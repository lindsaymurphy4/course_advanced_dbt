# Week 3 Questions

### Task 1: Identify a few redundant tests that can be removed
- Removed all not_null checks from all columns in dim_users that are not calculated/derived as these are already checked in stg_bingeflix__users.
- Updated README.md to reflect the redundancy with the not_null checks.
- Updated README.md to remove "Columns that contain category values must have an accepted_values schema test" from sources as we're not actually adhering to this (see subscription_id)
- Updated README.md to remove boolean conventions as we don't have any columns with the boolean type
