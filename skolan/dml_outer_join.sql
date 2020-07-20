-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: dml_outer_join.sql
-- Module content: Outer Join exercises.
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.



-- 1.
select distinct
    akronym,
    concat(fornamn, ' ', efternamn, ' (', akronym, ')') as namn
from v_planering
    order by akronym
;



-- 2. Left Outer Join, 
select distinct
    akronym,
    concat(fornamn, ' ', efternamn, ' (', akronym, ')') as namn,
    l.avdelning as avdelning,
    kt.kurskod as kurskod
from larare as l
    left outer join kurstillfalle as kt
        on l.akronym = kt.kursansvarig
    order by akronym asc, kt.kurskod asc
;



-- 3. Right Outer Join
select distinct
    akronym,
    concat(fornamn, ' ', efternamn, ' (', akronym, ')') as namn,
    l.avdelning as avdelning,
    kt.kurskod as kurskod
from larare as l
    right outer join kurstillfalle as kt
        on l.akronym = kt.kursansvarig
    order by akronym asc, kt.kurskod asc
;



-- 4.
select distinct
    k.kod as kurskod,
    concat(k.namn, ' (', k.kod, ')') as kursnamn,
    kt.lasperiod as lasperiod
from kurs as k
    left outer join kurstillfalle as kt
        on k.kod = kt.kurskod
    having lasperiod is null
    order by kurskod asc
;
