with

users as (
    select
        *
    from
        {{ ref('stg_bingeflix__users') }}
),

users_subscription_facts as (
    select
        user_id,
        min(starts_at) as first_subscription_starts_at,
        count(distinct subscription_id) as count_of_subscriptions
    from
        {{ ref('stg_bingeflix__subscriptions') }}
    group by 1
),

final as (
    select
        u.user_id,
        created_at,
        phone_number,
        deleted_at,
        username,
        name,
        sex,
        email,
        birthdate,
        truncate(datediff(month, birthdate, current_date)/12) as current_age,
        truncate(datediff(month, birthdate, created_at)/12) as age_at_acquisition,
        region,
        country,
        usf.first_subscription_starts_at,
        usf.count_of_subscriptions
    from
        users as u
        left join users_subscription_facts as usf on u.user_id = usf.user_id
)

select * from final
