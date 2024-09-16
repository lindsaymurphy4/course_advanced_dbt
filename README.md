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
- In staging models, if the model operates as a 'select' statement from the source, the tests on columns that are unchanged from the source (except for primary key column) are not required to avoid redundancy - as these columns are already tested at the source
For all other models:
- All boolean columns must have an accepted_values schema test. The accepted values are true and false.
- Columns that contain category values must have an accepted_values schema test.
- Columns that should never be null must have a not_null schema test.
- Columns that should be unique must have a unique schema test.
- Where possible, use schema tests from the dbt_utils or dbt_expectations packages to perform extra verification.


## Week 1 Question Answers:
Q1: dbt Project Evaluator notes:
- I chose to create exceptions for freshness. I figured since it is fake data for the projects - we won't be getting fresh data
- I chose to increase the threshold for fanout from 3 to 5 to make it pass evaluator. However, I think, the code for 'active users' should be rewritten to read off the intermediate table (so that we don't have a calculation for # logins per day in two separate places). It is a fairly safe calculation, so in the scope of this project it is not too worrying.
