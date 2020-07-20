-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: dml_join.sql
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.



-- Example of join tables
-- --------------------------------------------------
-- 1. 
select
    l.akronym,
    l.lon,
    l.kompetens,
    p.lon as "pre-lon",
    p.kompetens as "pre-kompetens"
from larare as l
    join larare_pre as p
        on l.akronym = p.akronym
order by akronym
;

-- 1 Exercise of join tables and case(if-statments in SQL)
-- --------------------------------------------------
-- 1.1 create a report that show teachers with raise less then 3%
select
    l.akronym,
    concat(l.fornamn, ' ', l.efternamn) as namn,
    l.lon,
    p.lon as "pre-lon",
    round(((l.lon - p.lon) / p.lon) * 100, 2) as procent
from larare as l
    join larare_pre as p
        on l.akronym = p.akronym
having procent < 3.00
order by akronym
;

-- 2 Exercise of join tables and case(if-statments in SQL)
-- --------------------------------------------------
-- 2.1 create a view to report salary revision.
drop view if exists v_lonerevision;

create view v_lonerevision
as
select
    l.akronym,
    concat(l.fornamn, ' ', l.efternamn) as namn,
    p.lon as "pre-lonerev.",
    l.lon as "lon-nu",
    l.lon - p.lon as diff,
    round(((l.lon - p.lon) / p.lon) * 100, 2) as procent,
    case when round(((l.lon - p.lon) / p.lon) * 100, 2) < 3.00 then 'not ok'
        else 'ok' end as mini
from larare as l
    join larare_pre as p
        on l.akronym = p.akronym
order by procent desc
;

select * from v_lonerevision;
