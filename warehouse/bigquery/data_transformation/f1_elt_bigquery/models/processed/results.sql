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
    R.resultId AS result_id
    , R.raceId AS race_id
    , R.driverId AS driver_id
    , R.constructorId AS constructor_id    
    , R.number
    , R.grid
    , CAST(NULLIF(R.position, '\\N') AS INT) AS position
    , R.positionText AS position_text
    , R.positionOrder AS position_order
    , R.rank
    , R.points
    , R.laps
    , R.time
    , R.milliseconds
    , R.fastestLap AS fastest_lap
    , R.fastestLapTime AS fastest_lap_time
    , R.fastestLapSpeed AS fastest_lap_seed
    , CURRENT_DATETIME() AS meta_ingestion_date
FROM
    {{ source('f1_landing', 'results') }} R