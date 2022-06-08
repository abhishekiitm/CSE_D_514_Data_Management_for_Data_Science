-- For each origin city, find the percentage of departing flights shorter than 3 hours.You should not include canceled flights in your determination. (15 points)
-- Name the output columns origin_city and percentage. Order by percentage value, then city, ascending. 
-- Be careful to handle cities without any flights shorter than 3 hours. 
-- You should return 0 as the result for these cities, not NULL (which is shown as a blank cell in Azure) 
-- Report percentages as percentages not decimals (e.g., report 75.2534 rather than 0.752534). Do not round the percentages.
-- [Output relation cardinality: 327]

SELECT T.origin_city, AVG(T.is_short_flight)*100 AS percentage FROM 
(
SELECT F.origin_city,
CASE
    WHEN F.actual_time < 3*60 THEN 1.0
    ELSE 0.0
END AS is_short_flight
FROM FLIGHTS AS F
WHERE F.canceled = 0
) AS T
GROUP BY T.origin_city
ORDER BY PERCENTAGE ASC, T.origin_city ASC;


-- (327 rows affected) 	
-- Total execution time: 00:00:05.375

-- origin_city	percentage
-- Guam TT	0.000000
-- Pago Pago TT	0.000000
-- Aguadilla PR	28.897300
-- Anchorage AK	31.812000
-- San Juan PR	33.660500
-- Charlotte Amalie VI	39.558800
-- Ponce PR	40.983600
-- Fairbanks AK	50.116500
-- Kahului HI	53.514400
-- Honolulu HI	54.739000
-- San Francisco CA	55.828800
-- Los Angeles CA	56.080800
-- Seattle WA	57.609300
-- Long Beach CA	62.176400
-- New York NY	62.371800
-- Kona HI	63.160700
-- Las Vegas NV	64.920200
-- Christiansted VI	65.100600
-- Newark NJ	65.849900
-- Plattsburgh NY	66.666600