-- Daniel Andersson, daap19
-- Databas @ BTH VT-20
-- Kmom 02 - Mer SQL övningar (skolan)
-- --------------------------------------------------



-- 1. Exercises with MIN / MAX:
-- --------------------------------------------------
-- 1.1 MAX(lon):
SELECT
    MAX(lon) as toplon
FROM larare
;

-- 1.2 MIN(lon)
SELECT 
    MIN(lon)
FROM larare
;



-- 2. Exercises with GROUP BY:
-- --------------------------------------------------
-- 2.1 Count teachers at department and sort by decending order.
SELECT
    avdelning,
    COUNT(avdelning)
FROM larare
GROUP BY avdelning
ORDER BY avdelning DESC
;

-- 2.2 How much is each department paying in salaries every month.
SELECT
    avdelning,
    SUM(lon) as Summa
FROM larare
GROUP BY avdelning
ORDER BY Summa DESC
;

-- 2.3 What is the average salary per department sorted descending order.
SELECT
    avdelning,
    AVG(lon) as medellonen
FROM larare
GROUP BY avdelning
ORDER BY medellonen DESC
;

-- 2.4 How much is the average salary for women & men.
SELECT
    kon,
    AVG(lon) as Medellon
FROM larare
GROUP BY kon
ORDER BY Medellon DESC
;



-- 3. Exercises with GROUP BY
-- --------------------------------------------------
-- 3.1 What is the average kompetense per department?
SELECT 
    avdelning,
    AVG(kompetens) as snittkompetens
FROM larare
GROUP BY avdelning
ORDER BY snittkompetens DESC
;

-- 3.2 What is the average salary per department and per kompetens?
-- sorted by department and average salary.
SELECT 
    avdelning,
    kompetens,
    ROUND(AVG(lon), 0) as snittlon,
    COUNT(*) as antal
FROM larare
GROUP BY avdelning, kompetens, lon
ORDER BY avdelning, snittlon
;



-- 4. Exercises with HAVING
-- --------------------------------------------------
-- Example 1.
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY avdelning
ORDER BY Snittlon DESC
;

-- Exercise 4.1 SELECT department with avrage salary higher then 35000 with HAVING.
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY avdelning
HAVING Snittlon > 35000
ORDER BY Snittlon DESC
;

-- Exercise 4.2 SELECT department average salary if number of teachers are 3 or more.
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY avdelning
HAVING Antal > 2
ORDER BY Snittlon DESC
;



-- 5. WHERE vs. HAVING
-- --------------------------------------------------
-- Example 1.1 WHERE
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
WHERE kompetens = 1
GROUP BY avdelning
ORDER BY avdelning
;

-- Example 1.2 add HAVING
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
WHERE kompetens = 1
GROUP BY avdelning
HAVING Snittlon < 30000
ORDER BY avdelning
;



-- HAVING Exercises
-- --------------------------------------------------
-- Exercise 5.1 SELECT department, how many employees, the groups avrage salary and sort by department and avg.salary.
SELECT
    avdelning,
    COUNT(*) AS antal,
    ROUND(AVG(lon), 0) AS snittlon
FROM larare
GROUP BY avdelning
ORDER BY avdelning, snittlon
;

-- Exercise 5.2 SELECT same as 5.1, add kompetens, group by department and kompetens, sort by department and avrage salery.
SELECT
    avdelning,
    kompetens,
    COUNT(*) AS antal,
    ROUND(AVG(lon), 0) AS snittlon
FROM larare
GROUP BY avdelning, kompetens
ORDER BY avdelning, kompetens DESC
;

-- Exercise 5.3 SELECT same as 5.2, add HAVING kompetens max 3.
SELECT
    avdelning,
    kompetens,
    COUNT(*) AS antal,
    ROUND(AVG(lon), 0) AS snittlon
FROM larare
GROUP BY avdelning, kompetens
HAVING kompetens < 4
ORDER BY avdelning, kompetens DESC
;

-- Exercise 5.4 SELECT same as 5.3 with a avrage salary of min 30000 and max 45000 also exclude all groups with more then 1 antal.
SELECT
    avdelning,
    kompetens,
    COUNT(*) AS antal,
    ROUND(AVG(lon), 0) AS snittlon
FROM larare
WHERE kompetens < 4
GROUP BY avdelning, kompetens
HAVING 
    snittlon >= 30000 AND snittlon <= 45000 AND
    antal < 2
ORDER BY avdelning, kompetens DESC
;
