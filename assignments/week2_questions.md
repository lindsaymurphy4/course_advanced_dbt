# Week 2 Questions

### Task 1: Add SQLFluff to pre-commit hook
- Installed and ran the default configuration
- Commit all fixes flagged by this (10+ files with whitespace and empty line breaks)

### Task 2: Add more pre-commit hooks to enforce project conventions
- Added DBT checkpoints to config and ran
- Fixed missing documentation for couple of columnd on dim_user
- Added the following hooks:
  - *check-model-has-description* - Check the model has description but only set up to check the models folder
  - *check-script-has-no-table-name* - Check the script has not table name (is not using source() or ref() macro for all tables).
  - *check-script-ref-and-source* - Check the script has only existing refs and sources.
  - *dbt-test* - Run the DBT tests post hook. I found this one to be the most userful
- Additionally added a hook for *check-model-tags* as part of the optional exercise, and set the args to ["--tags", "hourly", "daily", "weekly", "monthly", "--"] and the folder to ^models/marts/core/

### Task 3: Generalize a custom macro
- Created a macro named *rolling_average.sql* and included a documentation yml named *rolling_average.yml*
- This new version takes a time_unit (days, weeks, months) for naming, custom period (number of rows to average).
- Additionally it will take a list of column names that you wish to apply this to, rather than a single column name.
- Added a new model named "int_subscriptions_per_month" to group subscriptions by month.
- Added a new model named "fct_active_subscriptions" to use the above intermediate model and leverage the rolling_average macro.
