
SELECT DISTINCT (flight_num)
FROM FLIGHTS as F
JOIN CARRIERS as C on C.cid = F.carrier_id
JOIN WEEKDAYS as W on W.did = F.day_of_week_id
WHERE 
F.origin_city = 'Seattle WA' AND F.dest_city = 'Boston MA' 
AND C.name = 'Alaska Airlines Inc.' AND W.day_of_week = 'Monday';

-- number of rows in the query result: 3

-- SELECT * FROM FLIGHTS
-- WHERE fid in 
-- (60111,
-- 60118,
-- 60125,
-- 60132,
-- 60457,
-- 60464,
-- 60471,
-- 60478,
-- 704695,
-- 704703,
-- 705648,
-- 708538,
-- 708546,
-- 708950,
-- 710650,
-- 710658,
-- 711062,
-- 715497,
-- 715505,
-- 716453);