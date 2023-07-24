{{
    config(
        materialized='table'
    )
}}

SELECT
    qualifyId AS qualify_id
    , raceId AS race_id
    , driverId AS driver_id
    , constructorId AS constructor_id
    , number
    , position
    , q1
    , q2
    , q3
    , CURRENT_DATETIME() AS meta_ingestion_date
FROM
    {{ source('f1_landing', 'qualifying') }}