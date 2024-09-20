# Week 4 Questions

### Task 1: Create an incremental model
- Changed `fct_events` to an `incremental` model as opposed to a `table`.
- Ensured the `event_id` was used as the unique key and added a lookback window of 3 days.

### Task 2: Add dbt-snowflake-monitoring package to monitor Snowflake costs
- Installed `dbt_snowflake_monitoring` package.
- Added configuration to `dbt_project.yml`.
- Ran the following query to identify top 5 costliest queries:
```sql
    WITH max_date AS (
        SELECT MAX(DATE(end_time)) AS date
        FROM dbt_queries
    )

    SELECT
        dbt_queries.dbt_node_id,
        sum(dbt_queries.query_cost) AS total_cost_last_30d,
        total_cost_last_30d*12 AS estimated_annual_cost
    FROM dbt_queries
    CROSS JOIN max_date
    WHERE
        dbt_queries.start_time >= DATEADD('day', -30, max_date.date)
        AND dbt_queries.start_time < max_date.date
        AND dbt_node_id NOT LIKE '%dbt_snowflake_monitoring%'
        --AND dbt_node_id LIKE '%model%advanced_dbt%'
    GROUP BY 1
    ORDER BY total_cost_last_30d DESC
    LIMIT 5
```
- From the query I identified that the mrr tests are the top 5 costliest queries
- You can uncomment the additional clause of `dbt_node_id like '%model%advanced_dbt%'` to just show the most costliest models, for which `model.advanced_dbt.stg_bingeflix_events` is the costliest.
- I ran the following query to show the avg, min and max of the costliest query (`test.advanced_dbt.unique_mrr_surrogate_key.871f470500`) and costliest model (`model.advanced_dbt.stg_bingeflix_events`):
```sql
    WITH daily_costs AS (
        SELECT
            dbt_node_id,
            DATE(start_time) AS date,
            SUM(query_cost) AS cost
        FROM dbt_queries
        GROUP by 1,2
    )

    SELECT
        dbt_node_id,
        AVG(cost) AS "avg_cost",
        MIN(cost) AS "min_cost",
        MAX(cost) AS "max_cost"
    FROM daily_costs
    WHERE dbt_node_id IN ('test.advanced_dbt.unique_mrr_surrogate_key.871f470500', 'model.advanced_dbt.stg_bingeflix_events')
    GROUP BY 1
```

### Task 3: Refactor mrr.sql to proactively avoid a modelneck
- I already created an `int_subscriptions_per_month` model in week 2 but I made some small changes to this in order to make it more accurate, mainly taking into account upgrades.
- Modified `fct_mrr` to utilise `int_subscriptions_per_month` and give similar output to previous, whilst aligning with the dbt mrr playbook.
