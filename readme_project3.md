## Task 1
I removed any tests from Staging that were 1:1 with the source (e.g., no transformation in the staging model).

I did leave the generic tests on the PK for each model.

For example, in subscription plans, plan_name has a not_null test in source, but no transformations are done in the stg model, so it's redundant to retest. However, pricing column has a macro applied, so I left the not_null test to check for any issues with the macro execution.

## Task 2
Added test "assert_valid_column_value" to check whether column contains a given keyword.

## Task 3
Added seeds files for unit test input and ouput for fct_mmr.
