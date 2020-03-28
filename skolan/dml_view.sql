-- Daniel Andersson, daap19
-- Databas @ BTH VT-20
-- Kmom 02 - Mer SQL övningar (skolan)
-- --------------------------------------------------



-- Examples with VIEWs:
-- --------------------------------------------------
-- Example 1 - without a view
SELECT
    CONCAT(fornamn, ' ', efternamn, ' (', LOWER(avdelning), ')') AS Namn,
        TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Ålderr
    FROM larare;

-- Example 2 - with a view
DROP VIEW IF EXISTS v_name_alder;

CREATE VIEW v_name_alder
AS
SELECT
    CONCAT(fornamn, ' ', efternamn, ' (', LOWER(avdelning), ')') AS Namn,
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Alder
FROM larare
;

SELECT * FROM v_name_alder;



-- 1. Exercises with VIEWs:
-- --------------------------------------------------
-- 1.1 CREATE VIEW that hold all columns from teachers and one that tells the age.
DROP VIEW IF EXISTS v_larare;

CREATE VIEW v_larare
AS
SELECT
    akronym,
    avdelning,
    fornamn,
    efternamn,
    kon,
    lon,
    fodd,
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS alder
FROM larare
;

-- 1.2 SELECT from the view in 1.1 
SELECT
    avdelning,
    ROUND(AVG(alder), 0) AS medelalder
FROM v_larare
GROUP BY avdelning
ORDER BY medelalder DESC
;
