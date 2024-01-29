## Project 1 Short Answer:
### Task 3: Reasons for fixes on dbt_project evaluator
1. mrr: renamed to fct_mrr because there is an established naming convention in the Marts models that should be followed for consistency.
2. fct_undocumented_sources (ads_platform source) - fixed by adding a source description; important for entities to be described so new users can quickly view the information.
3. fct_undocumented_source_tables ( daily ads): added descriptions with doc blocks to make sure there isn't a gap in documentation. There shouldn't be exceptions to documentation.
4. fct_model_fanout (stg_bingeflix__events) - added exception to allow staging models to have as many leafs as needed. Since the fields needed for the marts models were 1:1 from source, doesn't make sense to create an int model as a pass-through.