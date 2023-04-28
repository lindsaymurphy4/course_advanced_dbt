{% macro calculate_age(birth_date, comparison_date) %}

-- Part 1: Difference in years between birth date and comparison date minus 1
DATEDIFF('year', {{ birth_date }}, {{ comparison_date }}) - 1 +
    -- Part 2: Add 1 if the comparison date is past the birth date
    CASE
        WHEN DATE_PART('month', {{ comparison_date }}) > DATE_PART('month', {{ birth_date }}) THEN 1
        WHEN DATE_PART('month', {{ comparison_date }}) = DATE_PART('month', {{ birth_date }}) AND
            DATE_PART('day', {{ comparison_date }}) >= DATE_PART('day', {{ birth_date }}) THEN 1
        ELSE 0
    END

{% endmacro %}