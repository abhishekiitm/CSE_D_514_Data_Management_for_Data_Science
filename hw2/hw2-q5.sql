SELECT name, printf("%.2f", perc*100) as percentage
FROM
(
    SELECT F.carrier_id, C.name, AVG(canceled) as perc
    FROM FLIGHTS as F, CARRIERS as C
    WHERE F.carrier_id = C.cid AND
    F.origin_city = 'Seattle WA'
    GROUP BY F.carrier_id, C.name
    HAVING perc > 0.005
    ORDER BY perc ASC
);

-- number of rows in the query result: 6

-- alternately the below query gives the same result but has no nested query
-- SELECT C.name, printf("%.2f", AVG(canceled)*100) as percentage
-- FROM FLIGHTS as F, CARRIERS as C
-- WHERE F.carrier_id = C.cid AND
-- F.origin_city = 'Seattle WA'
-- GROUP BY F.carrier_id, C.name
-- HAVING AVG(canceled) > 0.005
-- ORDER BY AVG(canceled) ASC;

SELECT DISTINCT canceled FROM FLIGHTS;