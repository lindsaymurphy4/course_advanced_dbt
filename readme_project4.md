Top 5 costliest queries last 30 days
`
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
group by 1
order by total_cost_last_30d desc
limit 5
`

Cost per Day for costliest dbt model in last 30 days
`
select
    date(start_time) as date,
    sum(query_cost) as cost
from dbt_queries
where dbt_node_id is null
group by 1
order by 1 desc
`