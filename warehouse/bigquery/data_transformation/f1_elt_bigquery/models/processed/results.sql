{{
    config(
        materialized='table',
        partition_by = {
            'field': 'race_id',
            'data_type': 'integer',
            'granularity': 'year'
        }
    )
}}

SELECT
    resultId AS result_id
    , raceId AS race_id
    , driverId AS driver_id
    , constructorId AS constructor_id    
    , number
    , grid
    , position
    , positionText AS position_text
    , positionOrder AS position_order
    , rank
    , points
    , laps
    , time
    , milliseconds
    , fastestLap AS fastest_lap
    , fastestLapTime AS fastest_lap_time
    , fastestLapSpeed AS fastest_lap_seed
    , CURRENT_DATETIME() AS meta_ingestion_date
FROM
    {{ source('f1_landing', 'results') }}