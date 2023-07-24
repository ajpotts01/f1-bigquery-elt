SELECT
    RR.driver_name
    , COUNT(1) AS total_races
    , SUM(RR.normalized_points) AS total_points
    , ROUND(AVG(RR.normalized_points), 2) AS avg_points
FROM
    {{ ref('race_results') }} RR
GROUP BY
    RR.driver_name
HAVING
    total_races >= 50
ORDER BY
    avg_points DESC