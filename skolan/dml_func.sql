-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: dml_func.sql
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.



-- 1. Exercises with STRING functions:
-- --------------------------------------------------
-- 1.1 Find a function from the reference manual that takes firstname, lastname & department and puts it in a string in a single column.
select
    concat(fornamn, ' ', efternamn, ' (', avdelning, ')') as namn_och_avdelning
from larare
;

-- 1.2 Same as 1.1, add lower case on department and limit to 3 prints from query.
select
    concat(fornamn, ' ', efternamn, ' (', lower(avdelning), ')') as namn_och_avdelning
from larare 
limit 3
;


-- 2. Exercises with date functions:
-- --------------------------------------------------
-- 2.1 select todays date.
select
    curdate() as dagensdatum
;

-- 2.2 select all teachers, date of birth, todays date and time.
select
    concat(fornamn, ' ', efternamn) as larare,
    date(fodd) as fodelsedag,
    curdate() as dagensdatum,
    curtime() as klockslag
from larare
order by larare asc
;

-- 3. Exercises with AGE functions:
-- --------------------------------------------------
-- 3.1 select all teachers, their date of birth and calculate the age.
select
    concat(fornamn, ' ', efternamn) as larare,
    date(fodd) as fodelsedag,
    round(datediff(curdate(), date(fodd))/365, 0) as alder
from larare
order by larare asc
;

-- 4. Exercises with FILTER part of date:
-- --------------------------------------------------
-- 4.1 select all teachers where year is in the 1940s.
select
    concat(fornamn, ' ', efternamn) as larare,
    date(fodd) as fodelsedag,
    timestampdiff(year, date(fodd), curdate()) as alder
from larare
where year(fodd) between 1940 and 1949
order by larare asc
;
