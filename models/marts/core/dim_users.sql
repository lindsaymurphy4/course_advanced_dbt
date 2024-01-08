WITH

users AS (
    SELECT
        *
    FROM
        {{ ref('stg_bingeflix__users') }}
),

users_subscription_facts AS (
    SELECT
        user_id,
        MIN(starts_at) AS first_subscription_starts_at,
        COUNT(DISTINCT subscription_id) AS count_of_subscriptions
    FROM
        {{ ref('stg_bingeflix__subscriptions') }}
    GROUP BY 1
),

final AS (
    SELECT
        u.user_id,
        created_at,
        phone_number,
        deleted_at,
        username,
        name,
        sex,
        email,
        birthdate,
        TRUNCATE(DATEDIFF(MONTH, birthdate, CURRENT_DATE)/12) AS current_age,
        TRUNCATE(DATEDIFF(MONTH, birthdate, created_at)/12) AS age_at_acquisition,
        region,
        country,
        usf.first_subscription_starts_at,
        usf.count_of_subscriptions
    FROM
        users AS u
        LEFT JOIN users_subscription_facts AS usf ON u.user_id = usf.user_id
)

SELECT * FROM final
