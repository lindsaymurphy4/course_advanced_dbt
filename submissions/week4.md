
<h1>Week 4 Submission</h1>

<h2>Task 1: Build Incremental Model </h2>

- stg_bingeflix__events: [Link](https://github.com/mthbicf/course_advanced_dbt/blob/setup_dbt/models/staging/bingeflix/stg_bingeflix__events.sql)
- incremental_where_clause macro: [Link](https://github.com/mthbicf/course_advanced_dbt/blob/setup_dbt/macros/incremental_where_clause.sql)

<h2>Task 2: Snowflake Costs </h2>

Part 1:
```
with
max_date as (
    select max(date(end_time)) as date
    from dbt_queries
)
select
    dbt_queries.dbt_node_id,
    sum(dbt_queries.query_cost) as total_cost_last_30d,
    total_cost_last_30d*12 as estimated_annual_cost
from dbt_queries
cross join max_date
where
    dbt_queries.start_time >= dateadd('day', -30, max_date.date)
    and dbt_queries.start_time < max_date.date -- don't include partial day of data
    and dbt_node_id is not null
group by 1
order by total_cost_last_30d desc
limit 5
```

Part 2:
```
select
    date(start_time) as date,
    sum(query_cost) as cost
from dbt_queries
where dbt_node_id = 'model.dbt_snowflake_monitoring.stg_access_history'
group by 1
order by 1 desc
```

<h2>Task 3: MRR </h2>

- New Intermediate model: [Link](https://github.com/mthbicf/course_advanced_dbt/blob/setup_dbt/models/intermediate/finance/int_subscription_periods.sql)
- Unit Test: [Link](https://github.com/mthbicf/course_advanced_dbt/blob/setup_dbt/models/unit_test.yml)
- New Fct_mrr model: [Link](https://github.com/mthbicf/course_advanced_dbt/blob/setup_dbt/models/marts/finance/fct_mrr.sql)
