-- List all cities that cannot be reached from Seattle through a direct flight nor with one stop (i.e., with any two flights that go through an intermediate city). 
-- Warning: this query might take a while to execute. We will learn about how to speed this up in lecture. (15 points)
-- Name the output column city. Order the output ascending by city.
-- (You can assume all cities to be the collection of all origin_city or all dest_city)
-- (Note: Do not worry if this query takes a while to execute. We are mostly concerned with the results)
-- [Output relation cardinality: 3 or 4, depending on what you consider to be the set of all cities]


-- get neighbours of seattle
-- get neighbours of neighbours of seattle
-- union these two
-- subtract them from all flights

SELECT C.city FROM
(
    -- set of all cities
    SELECT origin_city as city FROM FLIGHTS
    UNION
    SELECT dest_city as city FROM FLIGHTS
) as C
WHERE C.city NOT IN (
    -- union of 1st and 2nd neighbours of Seattle
    SELECT N2.neighbour_2 AS city FROM
    (
        -- 2nd neighbours of Seattle
        SELECT DISTINCT F2.dest_city AS neighbour_2
        FROM FLIGHTS AS F2, 
        (
            -- distinct neighbours of Seattle
            SELECT DISTINCT F1.dest_city AS neighbour_1
            FROM FLIGHTS AS F1
            WHERE F1.origin_city = 'Seattle WA'
        ) AS N
        WHERE F2.origin_city = N.neighbour_1
    ) AS N2
    UNION
    SELECT N1.neighbour_1 AS city FROM
    (
        -- 1st neighbours of Seattle
        SELECT DISTINCT F1.dest_city AS neighbour_1
        FROM FLIGHTS AS F1
        WHERE F1.origin_city = 'Seattle WA'
    ) AS N1
)
ORDER BY C.city ASC;


-- (4 rows affected) 
-- Total execution time: 00:00:04.032

-- city
-- Devils Lake ND
-- Hattiesburg/Laurel MS
-- St. Augustine FL
-- Victoria TX

