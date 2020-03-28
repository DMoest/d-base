-- Daniel Andersson, daap19
-- Databas @ BTH VT-20
-- Kmom 02 - Mer SQL övningar (skolan)
-- --------------------------------------------------



-- COPY table:
-- --------------------------------------------------
DROP TABLE IF EXISTS larare_pre;
CREATE TABLE larare_pre LIKE larare;
INSERT INTO larare_pre SELECT * FROM larare;

SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;
SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare_pre;


