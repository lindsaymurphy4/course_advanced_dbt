{% macro unit_test__select_table(source_table, test_table) %}

    {% if var('unit_testing', false) == true %}
        {{ return(test_table) }}
    {% else %}
        {{ return(source_table) }}
    {% endif %}

{% endmacro %}
