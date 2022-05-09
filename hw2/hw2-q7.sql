
SELECT SUM(F.capacity) as capacity
FROM FLIGHTS as F, MONTHS as M
WHERE F.month_id = M.mid AND 
((F.origin_city = 'Seattle WA' AND F.dest_city = 'San Francisco CA') OR 
(F.origin_city = 'San Francisco CA' AND F.dest_city = 'Seattle WA'))
AND M.month = 'July' AND F.day_of_month = 10;

-- number of rows in the query result: 1