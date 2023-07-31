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
    qualifyId AS qualify_id
    , raceId AS race_id
    , driverId AS driver_id
    , constructorId AS constructor_id
    , number
    , position
    , q1
    , q2
    , q3
FROM
    {{ source('f1_landing', 'qualifying') }}