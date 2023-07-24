{{
    config(
        materialized='table'
    )
}}

SELECT
    constructorId AS constructor_id,
    constructorRef AS constructor_ref,
    name,
    nationality,
    CURRENT_DATETIME() AS meta_ingestion_date
FROM
    {{ source('f1_landing', 'constructors') }}