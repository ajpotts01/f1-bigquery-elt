{{
    config(
        materialized='table',
        partition_by={
            "field": "race_id",
            "data_type": "int64",
            "range": {
                "start": 1,
                "end": 4000,
                "interval": 1
            }
        }
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
FROM
    {{ source('f1_landing', 'pit_stops') }}