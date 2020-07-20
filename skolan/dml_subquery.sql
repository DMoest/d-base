-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: dml_subquery.sql
-- Module content: Subquery exercises.
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.



-- ex 1.
SELECT
    akronym 
FROM larare
WHERE
    avdelning = 'DIDD'
;

-- ex 2.
SELECT
    *
FROM kurstillfalle
;



-- 1. Slå samman de två exemplen med hjälp av en subquery:
select *
from kurstillfalle
where
    kursansvarig in (
        select akronym
        from larare
        where
            avdelning = 'DIDD'
    )
;



-- 2. Två subqueries med en union dem emellan:
(
    select akronym, avdelning from larare where avdelning = 'DIDD'
)
UNION
(
    select akronym, avdelning from larare where avdelning = 'DIPT'
)
;

-- alt.
select akronym, avdelning 
from larare
where avdelning like 'DIDD' or avdelning like 'DIPT';



-- 3. Exercise for subquery:
-- Show the oldest teacher with a subquery
select
    akronym,
    fornamn,
    efternamn,
    alder
from v_larare
where
    alder = (select max(alder) from v_larare)
order by alder desc
;
