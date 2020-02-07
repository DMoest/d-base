-- This is a part of traing SQL in the course "Databas" and it will cover the basics of databases. Student Daniel Andersson - daap19 2020-02-07.

-- DML (Data Manipulation Language) here I want to keep my SELECT, INSERT & UPDATE statements, DML_UPDATE_LONEREVISION.sql will be for UPDATE of a fictive senario where salaries are updated.



-- 1. Check how much is available for salary revision:
-- SELECT
--     SUM(lon) AS lönesumma,
--     SUM(lon)*0.064 AS "lönesumma ökning"
-- FROM larare
-- ;



-- 1. Update 'Albus' salary(lon) to 85000 and kompetens to '7':
UPDATE larare
    SET 
		kompetens = 7, 
        lon = 85000
WHERE
    fornamn = 'Albus'
;

-- 2. Update 'Minervas' salary(lon( with +4000:
UPDATE larare
	SET
		lon = (lon + 4000)
	WHERE
		fornamn = 'Minerva'
;

-- 3. Update 'Argus' salary(lon) with +2000 and kompetens to '3':
UPDATE larare
    SET
		kompetens = 3,
        lon = (lon + 2000)
WHERE
    fornamn = 'Argus'
;

-- 4. Update 'Gyllenroy' and 'Alastor' salaries(lon) with -3000:
UPDATE larare
    SET 
        lon = (lon - 3000)
WHERE 
	fornamn = 'Argus'
    AND fornamn = 'Gyllenroy'
;

-- 5. Update all teachers salary(lon) with +2% in the department(avdelning) 'DIDD':
UPDATE larare
    SET 
        lon = (lon * 1.02)
WHERE
    avdelning = 'DIDD'
;

-- 6. Update female teachers salary with +3% if they have < 40000:
UPDATE larare
	SET
		lon = (lon * 1.03)
	WHERE
		lon < 40000
        AND kon = 'K'
;


-- 7. Update Snape, Minerva and Hagrid extra +5000 salary(lon) and kompetens +1:
UPDATE larare
    SET
        lon = (lon + 5000),
        kompetens = (kompetens+ 1)
WHERE 
	fornamn IN ('Snape', 'Minerva', 'Hagrid')
;

-- 8. Give all teachers +2.2% except 'Snape', 'Minerva' and 'Hagrid':
UPDATE larare
	SET
		lon = (lon * 1.022)
	WHERE NOT
		fornamn IN ('Albus', 'Snape', 'Minerva', 'Hagrid')
;



SELECT akronym, avdelning, fornamn, kon, lon, kompetens
FROM larare
ORDER BY lon DESC
;
