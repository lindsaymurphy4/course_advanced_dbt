## Task 1: Identify a few redundant tests that can be removed

With the exception of primary keys, removed redundant tests in staging tables that already exist on source tables.

Updated this standard in the project README.

## Task 2: Write a custom generic test to replace a redundant singular test

Added custom generic test [here](https://github.com/sander-c-beck/course_advanced_dbt/blob/sander-project-3/tests/generic/assert_valid_string.sql)

## Task 3: Write a unit test to verify the logic of a transformation

Added unit test for age_at_acquisition (provided in course documentation).
Added second unit test for current_age. THIS TEST IS GOING TO FAIL once the actual CURRENT_DATE passes 2024-10-01. I struggled for a while to make this work based on the [course materials](https://uplimit.com/course/advanced-dbt/session/session_cltexnyi700a612850jefeljk/module/unit-testing#corise_cm008nkdz00043b7f8o0v3x5p) but I couldn't figure it out.

## Task 4: Practice writing a more complex unit test, to confirm MRR is calculated correctly
