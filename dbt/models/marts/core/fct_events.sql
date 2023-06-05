{{
  config(
    materialized='table'
  )
}}

SELECT
    *
FROM {{ ref('stg_bingeflix_events') }}

--TODO: Join is_subscriber flag
