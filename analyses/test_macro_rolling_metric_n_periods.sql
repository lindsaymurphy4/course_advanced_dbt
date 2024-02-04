select
    {{ rolling_metric_n_periods('gross_revenue', 'user_id', metric='sum', num=12) }}
from {{ ref('fct_events') }}
