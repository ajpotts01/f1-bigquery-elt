{{
    config(
        materialized='table',
        partition_by = {
            'field': 'race_timestamp',
            'data_type': 'timestamp',
            'granularity': 'year'
        }
    )
}}

SELECT
    raceId AS race_id
    , circuitId AS circuit_id
    , year AS race_year
    , round
    , name
    , TIMESTAMP(date || " " || REPLACE(time, "\\N", "00:00:00")) AS race_timestamp
    , CURRENT_DATETIME() AS meta_ingestion_date
FROM
    {{ source('f1_landing', 'races') }}