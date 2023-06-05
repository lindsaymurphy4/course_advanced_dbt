{% macro add_missing_stitch_column(schema_name, table_name, column_name) %}

    -- Stitch does not add a column into a table in the warehouse when the source column only contains NULL values.
    -- This makes it hard to define models. To make things easier, use this macro to add the missing column.
    -- Append a comma after you call the macro if the resulting column is not the last column added to the model.

    -- Check if the column exists in the table and schema mentioned in the macro arguments
    {%- call statement('result', fetch_result=True) -%}
        SELECT EXISTS (
            SELECT
                column_name
            FROM
                information_schema.columns
            WHERE
                table_schema = '{{schema_name}}'
                AND table_name = '{{table_name}}'
                AND column_name = '{{column_name}}'
        )
    {%- endcall -%}

    -- Return column_name if it the last column in the SELECT clause otherwise return column_name with comma
    {% if execute %}
        {%- set result = load_result('result')['data'][0][0] -%}
        {% if result %}
            {{column_name}}
        {% else %}
            NULL AS {{column_name}}
        {% endif %}
    {% endif %}

{% endmacro %}
