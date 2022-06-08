-- For each origin city, find the destination city (or cities) with the longest direct flight. 
-- By direct flight, we mean a flight with no intermediate stops. Judge the longest flight in time, not distance. (15 points)
-- Name the output columns origin_city, dest_city, and time representing the flight time between them. 
-- Do not include duplicates of the same origin/destination city pair. Order the result by origin_city and then dest_city (ascending, i.e. alphabetically).
-- [Output relation cardinality: 334 rows]


SELECT DISTINCT F.origin_city, F.dest_city, T.[time]
FROM FLIGHTS as F,
(
    SELECT origin_city, MAX(actual_time) as time  
    FROM FLIGHTS
    --WHERE origin_city = 'Seattle WA'
    GROUP BY origin_city
) as T
WHERE F.actual_time = T.[time] AND
F.origin_city = T.origin_city
ORDER BY F.origin_city ASC, F.dest_city ASC;


-- (334 rows affected) 
-- Total execution time: 00:00:03.369

-- origin_city	dest_city	time
-- Aberdeen SD	Minneapolis MN	106
-- Abilene TX	Dallas/Fort Worth TX	111
-- Adak Island AK	Anchorage AK	471
-- Aguadilla PR	New York NY	368
-- Akron OH	Atlanta GA	408
-- Albany GA	Atlanta GA	243
-- Albany NY	Atlanta GA	390
-- Albuquerque NM	Houston TX	492
-- Alexandria LA	Atlanta GA	391
-- Allentown/Bethlehem/Easton PA	Atlanta GA	456
-- Alpena MI	Detroit MI	80
-- Amarillo TX	Houston TX	390
-- Anchorage AK	Barrow AK	490
-- Appleton WI	Atlanta GA	405
-- Arcata/Eureka CA	San Francisco CA	476
-- Asheville NC	Chicago IL	279
-- Ashland WV	Cincinnati OH	84
-- Aspen CO	Los Angeles CA	304
-- Atlanta GA	Honolulu HI	649
-- Atlantic City NJ	Fort Lauderdale FL	212

