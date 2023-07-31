{{
    config(
        materialized='table'
    )
}}

SELECT
    constructorId AS constructor_id
    , constructorRef AS constructor_ref
    , name
    , nationality
FROM
    {{ source('f1_landing', 'constructors') }}