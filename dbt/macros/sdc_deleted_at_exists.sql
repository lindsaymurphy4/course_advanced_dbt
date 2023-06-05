
{% macro sdc_deleted_at_exists(schema_name, table_name) %}

    -- Check if the _sdc_deleted_at column exists
    {%- call statement('result', fetch_result=True) -%}
        SELECT EXISTS (
            SELECT
                column_name
            FROM
                information_schema.columns
            WHERE
                table_schema = '{{schema_name}}'
                AND table_name = '{{table_name}}'
                AND column_name = '_sdc_deleted_at'
        )
    {%- endcall -%}

    -- Return true if the column exists. Return false if it doesn't exist
    -- or when dbt is not in execution mode.
    {% if execute %}
        {%- set result = load_result('result')['data'][0][0] -%}
        {{ return(result) }}
    {% else %}
        {{ return(false) }}
    {% endif %}

{% endmacro %}
