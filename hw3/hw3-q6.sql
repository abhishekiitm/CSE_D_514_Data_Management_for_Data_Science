-- List the names of carriers that operate flights from Seattle to San Francisco, CA. 
-- Return each carrier's name only once. Use a nested query to answer this question. (7 points)
-- Name the output column carrier. Order the output ascending by carrier.
-- [Output relation cardinality: 4]


SELECT DISTINCT T.name FROM 
(
    SELECT F.*, C.* FROM FLIGHTS AS F, CARRIERS AS C
    WHERE F.carrier_id = C.cid
    AND F.origin_city = 'Seattle WA'
    AND F.dest_city = 'San Francisco CA'
) AS T
ORDER BY T.name ASC;


-- (4 rows affected) 	
-- Total execution time: 00:00:00.085

-- name
-- Alaska Airlines Inc.
-- SkyWest Airlines Inc.
-- United Air Lines Inc.
-- Virgin America