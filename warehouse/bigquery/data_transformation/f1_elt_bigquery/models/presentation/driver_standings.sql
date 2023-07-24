SELECT
    RR.race_year
    , RR.driver_name
    , RR.driver_nationality
    , RR.team
    , SUM(RR.points) AS total_points
FROM
    {{ ref('race_results') }} RR
GROUP BY
    RR.race_year
    , RR.driver_name
    , RR.driver_nationality
    , RR.team
