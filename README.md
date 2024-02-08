# Welcome to the Bingeflix Data Team

### Coding Conventions
#### General
- Use UPPER case for all keywords
- Use trailing commas in SELECT statements
- Use Snowflake dialect
- Use consistent style in GROUP BY and ORDER BY (either names or numbers, not both)


### Testing Conventions
#### Source
- Tests removed from source. Tests only at staging.
#### Staging
- The primary key source column must have not_null and unique generic tests.
- All boolean columns must have an accepted_values schema test. The accepted values are true and false.
- Columns that contain category values must have an accepted_values schema test.
- Columns that should be unique must have a unique schema test.
#### Models
- The primary key column must have not_null and unique schema tests.
- All boolean columns must have an accepted_values schema test. The accepted values are true and false.
- Columns that contain category values must have an accepted_values schema test.
- Columns that should never be null must have a not_null schema test.
- Columns that should be unique must have a unique schema test.
- Where possible, use schema tests from the dbt_utils or dbt_expectations packages to perform extra verification.


## Projects
### Week 1
- Task 2: Documentation added to doc blocks for all Bingeflix source models. Focussing on the subscriptions source table, documentation was added for all downstream models of subscriptions.
- Task 3: Dbt Project Evaluator was run. All documentation and test issues were addressed, as these are important for project organisation. Only two exceptions were added to the exceptions file: (1) mrr will remain in the model/mart/finance folder as there was no need to add a new reporting folder for this model, (2) stg_events has multiple children models, this is acceptable / expected as the events table is a key table
- Task 4: SQLFluff run and linting issues addressed
### Week 2
- Task 1: Added SQLFluff to pree-commit hook
-- Notes: Run either command below to check that the pre-commit hook is working properly:
--- pre-commit run --hook-stage commit sqlfluff-lint --all-files (This just lints)
--- pre-commit run --hook-stage manual sqlfluff-fix --all-files (This will provide an option to automatically fix any issues)
- Task 2: Added additional project checks from dbt-checkpoint
- Task 3: Generalized the custom macro and applied to two models
- Task 4: Wrote a custom macro, focussing on looping through columns to change white spaces to null
