WITH results AS (
    SELECT
        RR.race_year
        , RR.driver_name
        , RR.driver_nationality
        , RR.team
        , SUM(RR.points) AS total_points
        , COUNT(CASE WHEN RR.position = 1 THEN 1 END) AS wins
    FROM
        {{ ref('race_results') }} RR
    GROUP BY
        RR.race_year
        , RR.driver_name
        , RR.driver_nationality
        , RR.team
)
SELECT
    R.race_year
    , R.driver_name
    , R.driver_nationality
    , R.team
    , R.total_points
    , R.wins
    , RANK() OVER (PARTITION BY R.race_year ORDER BY total_points DESC, wins DESC) AS rank
FROM
    results R
