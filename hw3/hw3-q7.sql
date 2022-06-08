-- Express the same query as above, but do so without using a nested query. 
-- Again, name the output column carrier and order ascending by carrier. (8 points)                         
-- [Output relation cardinality: 4]


SELECT DISTINCT C.name FROM FLIGHTS AS F, CARRIERS AS C
WHERE F.carrier_id = C.cid
AND F.origin_city = 'Seattle WA'
AND F.dest_city = 'San Francisco CA'
ORDER BY C.name ASC;


-- (4 rows affected)
-- Total execution time: 00:00:00.061

-- name
-- Alaska Airlines Inc.
-- SkyWest Airlines Inc.
-- United Air Lines Inc.
-- Virgin America