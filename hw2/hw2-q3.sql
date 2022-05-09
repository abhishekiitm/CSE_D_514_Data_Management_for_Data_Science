
SELECT AVG(F.arrival_delay) 
FROM FLIGHTS as F, WEEKDAYS as W
WHERE F.day_of_week_id = W.did AND W.day_of_week = 'Monday'
AND F.origin_city = 'Seattle WA';

-- number of rows in the query result: 1