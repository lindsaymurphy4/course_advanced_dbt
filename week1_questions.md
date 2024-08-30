# Week 1 Questions

### Task 2: Add docs blocks to populate missing documentation and maintain consistency
- I ended up doing this for all bingeflix sources and downstream models
- I added a source table prefix to each column name to avoid conflicting column names such as created_at that has a slight variation across different models

### Task 3: Install dbt_project_evaluator package to enforce best practices
- *dbt_project_evaluator.marts.structure.is_empty_fct_model_naming_conventions* - I chose to fix this by adding a "fct_" prefix to the "mrr" model. This kept things consistent with all other models.
- *dbt_project_evaluator.marts.tests.is_empty_fct_sources_without_freshness* - I added freshness checks of 7 days for all sources. In the real world this would be lower but I assume the data is only going to be refreshed for this project weekly.
- *dbt_project_evaluator.marts.documentation.is_empty_fct_undocumented_source_tables* - Added documentation for the "ads_platform.daily_ads" source
- *dbt_project_evaluator.marts.dag.is_empty_fct_model_fanout* - For this I added an exception as there were only 3 (the threshold) lead nodes and I was comfortable with that remaining so. As the data model grows this may want to be addressed.

### Task 4: Install SQLFluff and run it to fix violations
- I added an exclusion for the *tests/* folder as this folder contained macros.
- I kept all other options default and ran/fixed all violations highlighted.
- This is another tool I will definitely look to adopt into my workflow going forward.