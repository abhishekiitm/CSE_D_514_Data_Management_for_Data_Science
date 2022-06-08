-- Find all origin cities that only serve flights shorter than 3 hours. You should not include canceled flights in your determination. (15 points)
-- Name the output column city and sort them in ascending order alphabetically. List each city only once in the result.
-- [Output relation cardinality: 109]


SELECT DISTINCT origin_city as city
FROM FLIGHTS
WHERE origin_city NOT IN (
    SELECT F.origin_city 
    FROM FLIGHTS as F
    WHERE actual_time >= 3*60 AND canceled=0
)
ORDER BY city ASC;


-- (109 rows affected)	
-- Total execution time: 00:00:06.687

-- city
-- Aberdeen SD
-- Abilene TX
-- Alpena MI
-- Ashland WV
-- Augusta GA
-- Barrow AK
-- Beaumont/Port Arthur TX
-- Bemidji MN
-- Bethel AK
-- Binghamton NY
-- Brainerd MN
-- Bristol/Johnson City/Kingsport TN
-- Butte MT
-- Carlsbad CA
-- Casper WY
-- Cedar City UT
-- Chico CA
-- College Station/Bryan TX
-- Columbia MO
-- Columbus GA