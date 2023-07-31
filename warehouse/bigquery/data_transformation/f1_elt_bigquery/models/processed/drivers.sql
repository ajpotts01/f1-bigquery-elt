{{
    config(
        materialized='table'
    )
}}

SELECT
    driverId AS driver_id
    , driverRef AS driver_ref
    , number
    , code
    , name.forename || " " || name.surname AS name
    , dob
    , nationality
FROM
    {{ source('f1_landing', 'drivers') }}