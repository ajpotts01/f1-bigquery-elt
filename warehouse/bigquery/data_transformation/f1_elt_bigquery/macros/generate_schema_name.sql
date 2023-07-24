-- https://docs.getdbt.com/docs/build/custom-schemas
{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name != none and (target.name == 'dev-sa-oauth' or target.name == 'dev') -%}

        {{ custom_schema_name | trim }}

    {%- else -%}

        {{ default_schema }}

    {%- endif -%}

{%- endmacro %}