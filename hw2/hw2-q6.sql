SELECT name as carrier, max_price
FROM
(
    SELECT F.carrier_id, C.name, MAX(F.price) as max_price
    FROM FLIGHTS as F, CARRIERS as C
    WHERE F.carrier_id = C.cid AND 
    ((F.origin_city = 'Seattle WA' AND F.dest_city = 'New York NY') OR 
    (F.origin_city = 'New York NY' AND F.dest_city = 'Seattle WA'))
    GROUP BY F.carrier_id, C.name
);

-- number of rows in the query result: 3

-- alternatively the below query gives the same result but has no nested query
-- SELECT C.name as carrier, MAX(F.price) as max_price
-- FROM FLIGHTS as F, CARRIERS as C
-- WHERE F.carrier_id = C.cid AND 
-- (F.origin_city = 'Seattle WA' AND F.dest_city = 'New York NY' OR 
-- F.origin_city = 'New York NY' AND F.dest_city = 'Seattle WA')
-- GROUP BY F.carrier_id, C.name;