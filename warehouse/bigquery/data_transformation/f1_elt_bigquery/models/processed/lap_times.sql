{{
    config(
        materialized='table'
    )
}}

SELECT
    raceId AS race_id
    , driverId AS driver_id
    , lap
    , position
    , time
    , milliseconds
    , CURRENT_DATETIME() AS meta_ingestion_date
FROM
    {{ source('f1_landing', 'lap_times') }}