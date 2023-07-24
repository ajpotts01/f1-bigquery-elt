SELECT
    RR.team
    , COUNT(1) AS total_races
    , SUM(RR.normalized_points) AS total_points
    , ROUND(AVG(RR.normalized_points), 2) AS avg_points
FROM
    {{ ref('race_results') }} RR
GROUP BY
    RR.team
HAVING
    total_races >= 100
ORDER BY
    avg_points DESC