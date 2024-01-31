# Week 1 Project

## Task 2: Add docs blocks to populate missing documentation and maintain consistency
I put all the project's documentation on doc blocks.
Usually we create doc blocks for sources and then one md file for every model. In this file we write the model description
and new columns that were created within this model or columns that were changed and now the definition is different.

For example in the source `bingeflix.subscription_plans` there is a column named `pricing`, however in
`stg_bingeflix__subscription_plans` this columns is transformed using the macro `cents_to_dollars` meaning that
in the source, pricing column is in cents and in stg model (and downstream models) `pricing` is in dollars.
Therefore, in my opinion, there should be 2 doc blocks, one for the source and one for the stg model, and it is the last one
that is going to be use downstream.

## Task 3: Task 3: Install dbt_project_evaluator package to enforce best practices
After adding all documentation I only got 4 warnings:
- Naming conventions for `mrr.sql` model
- Missing primary key tests in `fct_events.sql` model
- Model fanout in `stg_bingeflix__events`
- Valid test coverage (This is related to the second one)

1. For the naming convention warning I renamed the model `mrr` to `rpt_mrr`.
    - After the renaming I got the warning "fct_model_directories", so to practice exceptions I added rpt_mrr to the exceptions seed to allow rpt models in the same directory as fct models.
2. For the tests warnings I just added the primary key test to `fct_events`.
3. For the fanout problem I realized that `fct_events` contains the same data as `stg_bingeflix__events`, so I connected `stg_bingeflix__events` downstream models to `fct_events`.

## Task 4: [OPTIONAL] Install SQLFluff and run it to fix violations
For this task I set all keywords to upper case, and a line lenght of 100, then I used `sqlfluff fix` to lint the code.


# Welcome to the Bingeflix Data Team

### Coding Conventions
#### General
- Use UPPER case for all keywords
- Use trailing commas in SELECT statements
- Use Snowflake dialect
- Use consistent style in GROUP BY and ORDER BY (either names or numbers, not both)


### Testing Conventions
#### Sources
- The primary key source column must have not_null and unique generic tests.
- All boolean columns must have an accepted_values schema test. The accepted values are true and false.
- Columns that contain category values must have an accepted_values schema test.
- Columns that should never be null must have a not_null schema test.
- Columns that should be unique must have a unique schema test.

#### Models
- The primary key column must have not_null and unique schema tests.
- All boolean columns must have an accepted_values schema test. The accepted values are true and false.
- Columns that contain category values must have an accepted_values schema test.
- Columns that should never be null must have a not_null schema test.
- Columns that should be unique must have a unique schema test.
- Where possible, use schema tests from the dbt_utils or dbt_expectations packages to perform extra verification.
