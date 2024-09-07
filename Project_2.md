## Task 1: Add SQLFluff to pre-commit hook

Done [here](https://github.com/sander-c-beck/course_advanced_dbt/blob/sander-project-2/.pre-commit-config.yaml#L8)

## task 2: Add more pre-commit hooks to enforce project conventions

Added the default checks in course documentation, plus the tags check in core models [here](https://github.com/sander-c-beck/course_advanced_dbt/blob/sander-project-2/.pre-commit-config.yaml#L35)

## Task 3: Generalize a custom macro

I created [rolling_aggregation](https://github.com/sander-c-beck/course_advanced_dbt/blob/sander-project-2/macros/rolling_aggregation.sql) to essentially be fully customizable. You can select any aggregation type (avg, sum, etc), time period, and partition/order by criteria (which will change depending on the model).

I applied this macro in `fct_active_users` to calculate a user's average weekly logins over the past 3 months.

## Task 4: Write a custom macro to improve another part of the codebase

As suggested in the instructions, I focused on `fct_mrr`. There were probably a few options here. I decided to turn the LAG function in the `mrr_with_changes` CTE into a macro [here](https://github.com/sander-c-beck/course_advanced_dbt/blob/sander-project-2/macros/prior_period_value.sql).

I chose this because I think it aligns well with this model. Financial models often need to compare previous month (or other period) values with current, so this macro will allow us to easily pull those values instead of repeating LAG functions. I set default values here because I think the primary use case with be `fct_mrr` and it will make those calls easier, but if you specify all args the macro can be generalized across the project.
