-- This is a part of traing SQL in the course "Databas" and it will cover the basics of databases. Student Daniel Andersson - daap19 2020-02-07.

-- DML (Data Manipulation Language) here I want to keep my select, INSERT & update statements, DML_update_LONEREVISION.sql will be for update of a fictive senario where salaries are updated.



-- 1. Check how much is available for salary revision:
select
    sum(lon) as lönesumma,
    sum(lon)*0.064 as "lönesumma ökning"
from larare
;



-- 1. update 'Albus' salary(lon) to 85000 and kompetens to '7':
update larare
    set 
		kompetens = 7, 
        lon = 85000
where
    fornamn = 'Albus'
;

-- 2. update 'Minervas' salary(lon( with +4000:
update larare
	set
		lon = (lon + 4000)
	where
		fornamn = 'Minerva'
;

-- 3. update 'Argus' salary(lon) with +2000 and kompetens to '3':
update larare
    set
		kompetens = 3,
        lon = (lon + 2000)
where
    fornamn = 'Argus'
;

-- 4. update 'Gyllenroy' and 'Alastor' salaries(lon) with -3000:
update larare
    set 
        lon = (lon - 3000)
where 
	fornamn in ('Alastor', 'Gyllenroy')
;

-- 5. update all teachers salary(lon) with +2% in the department(avdelning) 'DIDD':
update larare
    set 
        lon = (lon * 1.02)
where
    avdelning = 'DIDD'
;

-- 6. update female teachers salary with +3% if they have < 40000:
update larare
	set
		lon = (lon * 1.03)
	where
		lon < 40000
        and kon = 'K'
;


-- 7. update Snape, Minerva and Hagrid extra +5000 salary(lon) and kompetens +1:
update larare
    set
        lon = (lon + 5000),
        kompetens = (kompetens + 1)
where 
	fornamn in ('Severus', 'Minerva', 'Hagrid')
;

-- 8. Give all teachers +2.2% except 'Snape', 'Minerva' and 'Hagrid':
update larare
	set
		lon = (lon * 1.022)
	where not
		fornamn in ('Albus', 'Severus', 'Minerva', 'Hagrid')
;



select akronym, avdelning, fornamn, kon, lon, kompetens
from larare
order by lon desc
;
