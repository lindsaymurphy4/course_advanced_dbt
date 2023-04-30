{% macro acquisition_channel(referral_source, referral_medium, referrer_user_id)  %}
    CASE
        -- APP STORES
        WHEN LOWER({{referral_source}}) = 'apple-app-store' AND LOWER({{referral_medium}}) IN ('app-store') THEN 'Apple App Store'
        WHEN LOWER({{referral_source}}) = 'google-play' AND LOWER({{referral_medium}}) IN ('app-store') THEN 'Google Play Store'

        -- PAID SEARCH
        WHEN LOWER({{referral_source}}) IN ('google', 'adwords', 'bing') AND LOWER({{referral_medium}}) = 'cpc' THEN 'Paid Search'

        -- PAID SOCIAL
        WHEN (LOWER({{referral_source}}) IN ('facebook', 'instagram', 'linkedin', 'paidsocial', 'paid social', 'youtube', 'website')
            AND LOWER({{referral_medium}}) = 'cpc')
            OR LOWER({{referral_medium}}) IN ('influencer', 'boosted post', 'paidsocial')
        THEN 'Paid Social'

        -- REFERRAL
        WHEN {{referrer_user_id}} IS NOT NULL THEN 'Maple User Referral'

        WHEN (LOWER({{referral_medium}}) IN ('website', 'referral', 'affinity')
            AND LOWER({{referral_source}}) NOT LIKE '%google%'
            AND LOWER({{referral_source}}) NOT LIKE '%facebook%'
            AND LOWER({{referral_source}}) NOT LIKE '%linkedin%'
            AND LOWER({{referral_source}}) NOT LIKE '%instagram%'
            AND CONCAT(CONCAT(LOWER({{referral_source}}),'/'), LOWER({{referral_medium}}))  NOT LIKE '%mail%'
            AND CONCAT(CONCAT(LOWER({{referral_source}}),'/'), LOWER({{referral_medium}}))  NOT LIKE '%tiktok.com/referral%')
            OR (LOWER({{referral_source}}) = 'ref_link' AND LOWER({{referral_medium}}) = 'link')
        THEN 'Referral'

        -- DIRECT
        WHEN LOWER({{referral_source}}) = '(direct)' THEN 'Direct'

        -- ORGANIC SEARCH
        WHEN LOWER({{referral_medium}}) = 'organic' OR ({{referral_source}}) LIKE '%yahoo%'
            OR (LOWER({{referral_source}}) LIKE '%google%' AND LOWER({{referral_medium}}) = 'referral'
            AND LOWER({{referral_source}}) NOT LIKE '%mail%'
            AND CONCAT(CONCAT(LOWER({{referral_source}}),'/'), LOWER({{referral_medium}})) NOT LIKE '%doubleclick%')
        THEN 'Organic Search'

        -- ORGANIC SOCIAL
        WHEN (LOWER({{referral_source}}) LIKE '%facebook%' AND LOWER({{referral_medium}}) IN ('referral', '(not set)'))
            OR (LOWER({{referral_source}}) LIKE '%linkedin%' AND LOWER({{referral_medium}}) = 'referral')
            OR (LOWER({{referral_source}}) LIKE '%instagram%' AND LOWER({{referral_medium}}) = 'referral')
            OR (CONCAT(CONCAT(LOWER({{referral_source}}),'/'), LOWER({{referral_medium}})) LIKE '%tiktok.com/referral%'
            AND LOWER({{referral_medium}}) = 'referral') OR LOWER({{referral_medium}}) = 'social'
        THEN 'Organic Social'

        -- Paid Display
        WHEN CONCAT(CONCAT(LOWER({{referral_source}}),'/'), LOWER({{referral_medium}})) LIKE '%stackadapt%'
            OR CONCAT(CONCAT(LOWER({{referral_source}}),'/'), LOWER({{referral_medium}})) LIKE '%display%'
            OR CONCAT(CONCAT(LOWER({{referral_source}}),'/'), LOWER({{referral_medium}})) LIKE '%outbrain%'
            OR CONCAT(CONCAT(LOWER({{referral_source}}),'/'), LOWER({{referral_medium}})) LIKE '%doubleclick%'
        THEN 'Paid Display'

        -- Email
        WHEN CONCAT(CONCAT(LOWER({{referral_source}}),'/'), LOWER({{referral_medium}})) LIKE '%email%'
            OR (CONCAT(CONCAT(LOWER({{referral_source}}),'/'), LOWER({{referral_medium}})) LIKE '%mail%' AND LOWER({{referral_medium}}) = 'referral')
            OR (LOWER({{referral_source}}) LIKE '%ue%' AND LOWER({{referral_medium}}) = '(not set)')
        THEN 'Email'

        -- Affiliate
        WHEN LOWER({{referral_medium}}) = 'affiliate' THEN 'Affiliate'

        -- OTHER (CATCH ALL)
        ELSE 'Other'
    END
{% endmacro %}