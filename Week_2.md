## Task 2
Was a bit wierd.. but i was able to add more pre commit hooks. Also would run this command below to look for specific files:
`pre-commit run check-model-tags --hook-stage commit --files fct_events.yml`

## Task 3
- Created  rolling_agg_n_periods
- generalized aggregation type and time period
- added documentation of macro
- applied it in "fct_mrr" (not a fact) model as a rolling_SUM_7_periods
