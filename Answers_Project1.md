# Reasoning for correcting the Project Evaluator warnings:

rename mrr.sql to fct_mrr in accordance with dbt prefix conventions
created a yml file for fact events as all marts should have a yml file for documentation and tests. used already created docblocks
Corrected source_ads_platform.yml to decalre all columns in stg table
corrected documentation for the ads table so that to remove ‘bingeflix' from the docblock table/column names so as to match the stg table.
corrected table name in fct_events.yml to be fct_events rather than fct_bingeflix_events as per the fct table name
Added exception to project evaluator file for ads_platform as this source is intentionally undocumented due to its simplicity
Added another exception for the fanout warning as This staging model is intentionally used by multiple downstream models
