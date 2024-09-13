<h1>Week 3 Submission</h1>

<h2>Task 1  Identify a few redundant tests that can be removed</h2>

Link to file:

From the Source schema, I removed:
- **Columns that should be unique must have a unique schema test.** Because I think what's important in source table is only the uniqueness of primary key as usually source data only send us a basic table with smallest granularity.

From the Model schema, I removed:
- **The primary key column must have not_null and unique schema tests.** Because in my opinion, the later stages where there are many joins are happening, the uniqueness could lie in one of few fields, so it's not only the primary key that we should tests, but all columns that should be unique, which is I didn't remove from the test list. And "not_null" test is already been done in the source, so we don't need to repeat this test again.
- **All boolean columns must have an accepted_values schema test. The accepted values are true and false.** This matter should be handled in source schema. If there's a case where boolean is a string or in another format, it should be standardized in Source schema.
- **Columns that should never be null must have a not_null schema test.** This matter should be handled in source schema.

<h2>Task 2: Write a custom generic test to replace a redundant singular test </h2>

Link to file: <a href="https://github.com/mthbicf/course_advanced_dbt/blob/setup_dbt/macros/aggregate_over_period.sql">here</a>.

<h2>Task 3: Write a unit test to verify the logic of a transformation</h2>

Link to file: <a href="https://github.com/mthbicf/course_advanced_dbt/blob/setup_dbt/macros/get_subscription_end_month.sql">here</a>.
