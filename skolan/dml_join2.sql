-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: dml_join2.sql
-- Module content: Join (part2)
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.

-- Cross join:
select * from kurs, kurstillfalle;
-- Varför blir det så många rader?
-- "för varje rad i ena tabellen, matcha mot samliga rader i den andra tabellen"



-- Join, using WHERE, use alias AS to shorten the statement:
-- select *
-- from kurs as k, kurstillfalle as kt
-- where k.kod = kt.kurskod;

-- Samma Join på ett annat sätt med ON:
select *
from kurs as k
    join kurstillfalle as kt
        on k.kod = kt.kurskod
;

-- Join three tables:
select *
from kurs as k
    join kurstillfalle as kt
        on k.kod = kt.kurskod
    join larare as l
        on l.akronym = kt.kursansvarig
;

-- Join tables to find amount of courses one teacher is responsible for:
select akronym, concat(fornamn, ' ', efternamn) as namn, count(akronym) as antal_kursansvar
from larare as l
    join kurstillfalle as kt
        on l.akronym = kt.kursansvarig
    group by akronym
    order by antal_kursansvar desc, akronym asc
;

-- 
select
    concat(k.namn, ' (', k.kod, ')') as kursnamn,
    concat(l.fornamn, ' ', l.efternamn, ' (', l.akronym, ')') as larare,
    timestampdiff(year, fodd, curdate()) as alder
from 
    (
    select
        larare.akronym,
        larare.fornamn,
        larare.efternamn,
        larare.fodd,
        timestampdiff(year, fodd, curdate()) as alder
    from larare
        join kurstillfalle as kt
            on larare.akronym = kt.kursansvarig
        group by
            larare.akronym,
            larare.fornamn,
            larare.efternamn,
            larare.fodd,
            alder
        order by alder desc limit 3
    ) as l
    join kurstillfalle as kt
        on l.akronym = kt.kursansvarig
    join kurs as k
        on kt.kurskod = k.kod
order by
    alder desc,
    kursnamn asc
;
