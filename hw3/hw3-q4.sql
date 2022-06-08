-- List all cities that can be reached from Seattle through one stop (i.e., with any two flights that go through an intermediate city) 
-- but cannot be reached through a direct flight. 
-- Do not include Seattle as one of these destinations (even though you could get back with two flights). (15 points)
-- Name the output column city. Order the output ascending by city.
-- [Output relation cardinality: 256]


SELECT DISTINCT F2.dest_city AS city
FROM FLIGHTS AS F2, 
(
    -- distinct neighbours of Seattle
    SELECT DISTINCT F1.dest_city AS neighbour
    FROM FLIGHTS as F1
    WHERE F1.origin_city = 'Seattle WA'
) AS N
WHERE F2.origin_city = N.neighbour
AND F2.dest_city != 'Seattle WA'
AND F2.dest_city NOT IN (
    -- distinct neighbours of Seattle
    SELECT DISTINCT dest_city
    FROM FLIGHTS 
    WHERE origin_city = 'Seattle WA'
)
ORDER BY city ASC;


-- (256 rows affected) 
-- Total execution time: 00:00:03.342

-- city
-- Aberdeen SD
-- Abilene TX
-- Adak Island AK
-- Aguadilla PR
-- Akron OH
-- Albany GA
-- Albany NY
-- Alexandria LA
-- Allentown/Bethlehem/Easton PA
-- Alpena MI
-- Amarillo TX
-- Appleton WI
-- Arcata/Eureka CA
-- Asheville NC
-- Ashland WV
-- Aspen CO
-- Atlantic City NJ
-- Augusta GA
-- Bakersfield CA
-- Bangor ME