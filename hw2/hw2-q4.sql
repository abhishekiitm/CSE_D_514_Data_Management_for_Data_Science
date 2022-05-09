SELECT DISTINCT name
FROM
(
    SELECT F.month_id, F.day_of_month, F.carrier_id, C.name, COUNT(F.fid) as no_flights
    FROM FLIGHTS as F, CARRIERS as C
    WHERE F.carrier_id = C.cid
    GROUP BY F.month_id, F.day_of_month, F.carrier_id
    HAVING no_flights > 1000
);

-- number of rows in the query result: 12

-- alternately the below query gives the same result but has no nested query
-- SELECT DISTINCT C.name
-- FROM FLIGHTS as F, CARRIERS as C
-- WHERE F.carrier_id = C.cid
-- GROUP BY F.month_id, F.day_of_month, F.carrier_id
-- HAVING COUNT(F.fid) > 1000