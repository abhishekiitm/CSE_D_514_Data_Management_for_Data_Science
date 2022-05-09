SELECT name, delay
FROM(
    SELECT C.cid, C.name, SUM(F.departure_delay) as delay 
    FROM FLIGHTS as F, CARRIERS as C
    WHERE F.carrier_id = C.cid
    GROUP BY C.cid, C.name
);

-- number of rows in the query result: 

-- alternatively the below query gives the same result but has no nested query
-- SELECT C.name, SUM(F.departure_delay) as delay 
-- FROM FLIGHTS as F, CARRIERS as C
-- WHERE F.carrier_id = C.cid
-- GROUP BY C.cid, C.name;