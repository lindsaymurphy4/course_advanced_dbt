SELECT
    *
FROM {{ ref('stg_bingeflix_users') }}

--TODO: Join is_subscriber flag
