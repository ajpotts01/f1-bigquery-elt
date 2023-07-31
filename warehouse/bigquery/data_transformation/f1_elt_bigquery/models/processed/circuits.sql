{{
    config(
        materialized='table'
    )
}}

SELECT
    circuitId AS circuit_id
    , circuitRef AS circuit_ref
    , name
    , location
    , country
    , lat AS latitude
    , lng AS longitude
    , alt AS altitude
FROM
    {{ source('f1_landing', 'circuits') }}