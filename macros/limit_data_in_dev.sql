{% macro limit_data_in_dev(ref_date = 'created_at', lookback_window_days = 3) -%}
    {% if target.name in ['dev'] -%}
        {{ref_date}} >= CURRENT_DATE - INTERVAL '{{lookback_window_days}} days'
    {% else %}
        TRUE
    {%- endif %}
{%- endmacro %}
