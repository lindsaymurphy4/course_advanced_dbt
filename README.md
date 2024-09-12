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
- Columns that should never be null must have a not_null schema test.
- Columns that should be unique must have a unique schema test.

#### Models
- The primary key column must have not_null and unique schema tests.
- Columns that contain category values must have an accepted_values schema test.
- Columns that should never be null must have a not_null schema test unless these are already checked on the source table.
- Columns that should be unique must have a unique schema test.
- Where possible, use schema tests from the dbt_utils or dbt_expectations packages to perform extra verification.
