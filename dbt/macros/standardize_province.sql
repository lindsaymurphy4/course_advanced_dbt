{% macro standardize_province_value(province_value) %}

    -- This macro is used to clean and standardize values in the source province column

    CASE TRIM(LOWER({{ province_value }}))
            WHEN 'alberta'                                                                              THEN 'Alberta'
            WHEN 'arizona'                                                                              THEN 'Arizona'
            WHEN 'british columbia'                                                                     THEN 'British Columbia'
            WHEN 'california'                                                                           THEN 'California'
            WHEN 'florida'                                                                              THEN 'Florida'
            WHEN 'india'                                                                                THEN 'India'
            WHEN 'georgia'                                                                              THEN 'Georgia'
            WHEN 'manitoba'                                                                             THEN 'Manitoba'
            WHEN 'new brunswick'                                                                        THEN 'New Brunswick'
            WHEN 'new york'                                                                             THEN 'New York'
            WHEN 'newfoundland and labrador'                                                            THEN 'Newfoundland and Labrador'
            WHEN 'northwest territories'                                                                THEN 'Northwest Territories'
            WHEN 'nova scotia'                                                                          THEN 'Nova Scotia'
            WHEN 'nouveau-brunswick'                                                                    THEN 'New Brunswick'
            WHEN 'nunavut'                                                                              THEN 'Nunavut'
            WHEN 'ontario'                                                                              THEN 'Ontario'
            WHEN 'outside canada'                                                                       THEN 'Outside Canada and USA'
            WHEN 'outside canada and usa'                                                               THEN 'Outside Canada and USA'
            WHEN 'prince edward island'                                                                 THEN 'Prince Edward Island'
            WHEN 'quebec'                                                                               THEN 'Quebec'
            WHEN 'québec'                                                                               THEN 'Quebec'
            WHEN 'saskatchewan'                                                                         THEN 'Saskatchewan'
            WHEN 'select'                                                                               THEN 'Unknown'
            WHEN 'unknown'                                                                              THEN 'Unknown'
            WHEN 'us state'                                                                             THEN 'US State'
            WHEN 'yukon'                                                                                THEN 'Yukon'
            WHEN 'yukon territory'                                                                      THEN 'Yukon'

            -- If province value is set to NULL in case the source value is empty or NULL
            WHEN ''                                                                                     THEN NULL
            WHEN NULL                                                                                   THEN NULL

            -- This case statement has been temporarily updated to set the unexpected province values
            -- to Unknown due to a known engineering bug. Once the bug is resolved this value should
            -- be reverted to NULL.
            -- Slack thread to the engineering bug: https://getmaple-ca.atlassian.net/browse/ENG-17854
            ELSE 'Unknown'
    END

{% endmacro %}
