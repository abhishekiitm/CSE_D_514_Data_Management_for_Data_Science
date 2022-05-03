-- 2.1
CREATE TABLE Edges(
    source INT NOT NULL,
    destination INT NOT NULL
);

-- 2.2
INSERT INTO Edges(source, destination)
VALUES
    (10, 5),
    (6, 25),
    (1, 3),
    (4, 4);

-- 2.3
SELECT * FROM Edges;

-- 2.4
SELECT source FROM Edges;

-- 2.5
SELECT * FROM Edges
WHERE source > destination;

-- 2.6
INSERT INTO Edges(source, destination)
VALUES
    ('-1', '2000');
-- sqlite has type affinity which automatically converts well-formed texts 
-- the appropriate column types, which is integer in this case


-- 3
CREATE TABLE MyRestaurants(
    name VARCHAR(100),
    cuisine VARCHAR(50),
    distance_minutes INT,
    last_visit VARCHAR(10),
    is_liked INT
);

-- 4
INSERT INTO MyRestaurants(name, cuisine, distance_minutes, last_visit, is_liked)
VALUES
    ('Mod Pizza', 'fast food', 15, '2022-04-05', 1),
    ('Thanh Vi', 'vietnamese', 15, '2022-03-23', NULL),
    ('Mr Lu''s Burgers and Seafood', 'seafood', 5, '2022-02-01', 0),
    ('Aladdin Falafel Corner', 'mediterranean', 15, '2022-02-18', 1),
    ('Pike Place Chowder', 'seafood', 45, '2022-03-19', 1),
    ('Delfino''s Chicago Style Pizza', 'pizza', 30, '2021-12-05', 1);

-- 5

-- 5.1
-- command to display headers in sqlite
.headers ON
-- print the results in comma-separated form
.mode csv
SELECT * FROM MyRestaurants;

-- print the results in list form, delimited by "|"
.mode list
SELECT * FROM MyRestaurants;

-- print the results in column form and make every column have width 15 
.mode column
.width 15 15 15 15 15
SELECT * FROM MyRestaurants;


-- 5.2
-- command to turn off headers in sqlite
.headers OFF
-- print the results in comma-separated form
.mode csv
SELECT * FROM MyRestaurants;

-- print the results in list form, delimited by "|"
.mode list
SELECT * FROM MyRestaurants;

-- print the results in column form and make every column have width 15 
.mode column
.width 15 15 15 15 15
SELECT * FROM MyRestaurants;


-- 6
SELECT name, distance_minutes FROM MyRestaurants
WHERE distance_minutes <= 20
ORDER BY name ASC;


-- 7
SELECT * FROM MyRestaurants
WHERE is_liked == 1 AND DATE('NOW', '-3 month') > DATE(last_visit);


-- 8
SELECT * FROM MyRestaurants
WHERE distance_minutes <= 10;