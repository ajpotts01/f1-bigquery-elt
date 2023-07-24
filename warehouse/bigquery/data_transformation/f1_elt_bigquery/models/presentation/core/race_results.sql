{{
    config(
        materialized='table'
    )
}}

SELECT
    RC.race_year
    , RC.name AS race_name
    , RC.race_timestamp AS race_date
    , CC.location AS circuit_location
    , D.name AS driver_name
    , D.number AS driver_number
    , D.nationality AS driver_nationality
    , CS.name AS team
    , RS.grid
    , RS.fastest_lap
    , RS.time AS race_time
    , RS.points
    , RS.position
    , CURRENT_DATETIME() AS meta_created_time
FROM
    {{ ref('results') }} RS
    INNER JOIN {{ ref('races') }} RC ON RC.race_id = RS.race_id
    INNER JOIN {{ ref('circuits') }} CC ON CC.circuit_id = RC.circuit_id
    INNER JOIN {{ ref('drivers') }} D ON D.driver_id = RS.driver_id
    INNER JOIN {{ ref('constructors') }} CS ON CS.constructor_id = RS.constructor_id