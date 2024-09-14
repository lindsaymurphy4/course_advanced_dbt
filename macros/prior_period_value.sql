{% macro prior_period_value(column, partition_by='user_id, subscription_id', order_by='date_month', value_if_null="'FALSE'") %}
  COALESCE(
    LAG({{ column }}) OVER (
      PARTITION BY {{ partition_by }}
      ORDER BY {{ order_by }}
    ),
    {{ value_if_null }}
  )
{% endmacro %}
