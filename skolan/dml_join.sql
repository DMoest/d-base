-- Daniel Andersson, daap19
-- Databas @ BTH VT-20
-- Kmom 02 - Mer SQL övningar (skolan)
-- --------------------------------------------------



-- Example of JOIN tables
-- --------------------------------------------------
-- 1. 
SELECT
    l.akronym,
    l.lon,
    l.kompetens,
    p.lon AS "pre-lon",
    p.kompetens AS "pre-kompetens"
FROM larare AS l
    JOIN larare_pre AS p
        ON l.akronym = p.akronym
ORDER BY akronym
;



-- 1 Exercise of JOIN tables and CASE(if-statments in SQL)
-- --------------------------------------------------
-- 1.1 Create a report that show teachers with raise less then 3%
SELECT
    l.akronym,
    CONCAT(l.fornamn, ' ', l.efternamn) AS namn,
    l.lon,
    p.lon AS "pre-lon",
    ROUND(((l.lon - p.lon) / p.lon) * 100, 2) AS procent
FROM larare AS l
    JOIN larare_pre AS p
        ON l.akronym = p.akronym
HAVING procent < 3.00
ORDER BY akronym
;


-- 2 Exercise of JOIN tables and CASE(if-statments in SQL)
-- --------------------------------------------------
-- 2.1 Create a view to report salary revision.
DROP VIEW IF EXISTS v_lonerevision;

CREATE VIEW v_lonerevision
AS
SELECT
    l.akronym,
    CONCAT(l.fornamn, ' ', l.efternamn) AS Namn,
    p.lon AS "pre-lonerev.",
    l.lon AS "lon-nu",
    l.lon - p.lon AS diff,
    ROUND(((l.lon - p.lon) / p.lon) * 100, 2) AS procent,
    CASE WHEN ROUND(((l.lon - p.lon) / p.lon) * 100, 2) < 3.00 THEN 'Not OK'
        ELSE 'OK' END AS mini
FROM larare AS l
    JOIN larare_pre AS p
        ON l.akronym = p.akronym
ORDER BY procent DESC
;

SELECT * FROM v_lonerevision;
