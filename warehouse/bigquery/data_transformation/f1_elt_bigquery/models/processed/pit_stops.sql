{{
    config(
        materialized='table'
    )
}}

SELECT
    raceId AS race_id
    , driverId AS driver_id
    , stop
    , lap
    , time
    , duration
    , milliseconds
    , CURRENT_DATETIME() AS meta_ingestion_date
FROM
    {{ source('f1_landing', 'pit_stops') }}