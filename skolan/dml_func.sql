-- Daniel Andersson, daap19
-- Databas @ BTH VT-20
-- Kmom 02 - Mer SQL övningar (skolan)
-- --------------------------------------------------



-- 1. Exercises with STRING functions:
-- --------------------------------------------------
-- 1.1 Find a function from the reference manual that takes firstname, lastname & department and puts it in a string in a single column.
SELECT
    CONCAT(fornamn, ' ', efternamn, ' (', avdelning, ')') AS NamnOchAvdelning
FROM larare
;

-- 1.2 Same as 1.1, add lower case on department and limit to 3 prints from query.
SELECT
    CONCAT(fornamn, ' ', efternamn, ' (', LOWER(avdelning), ')') AS NamnOchAvdelning
FROM larare 
LIMIT 3
;



-- 2. Exercises with DATE functions:
-- --------------------------------------------------
-- 2.1 SELECT todays date.
SELECT
    CURDATE() AS DagensDatum
;

-- 2.2 SELECT all teachers, date of birth, todays date and time.
SELECT
    CONCAT(fornamn, ' ', efternamn) AS Larare,
    DATE(fodd) AS Fodelsedag,
    CURDATE() AS DagensDatum,
    CURTIME() AS Klockslag
FROM larare
ORDER BY Larare ASC
;



-- 3. Exercises with AGE functions:
-- --------------------------------------------------
-- 3.1 SELECT all teachers, their date of birth and calculate the age.
SELECT
    CONCAT(fornamn, ' ', efternamn) AS Larare,
    DATE(fodd) AS Fodelsedag,
    ROUND(DATEDIFF(CURDATE(), DATE(fodd))/365, 0) AS Alder
FROM larare
ORDER BY Larare ASC
;


-- 4. Exercises with FILTER part of date:
-- --------------------------------------------------
-- 4.1 SELECT all teachers WHERE year is in the 1940s.
SELECT
    CONCAT(fornamn, ' ', efternamn) AS Larare,
    DATE(fodd) AS Fodelsedag,
    TIMESTAMPDIFF(YEAR, DATE(fodd), CURDATE()) AS Alder
FROM larare
WHERE YEAR(fodd) BETWEEN 1940 AND 1949
ORDER BY Larare ASC
;
