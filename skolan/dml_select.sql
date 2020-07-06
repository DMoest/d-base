-- This is a part of traing SQL in the course "Databas" and it will cover the basics of databases. Student Daniel andersson - daap19 2020-02-07.

-- DML (Data Manipulation Language) here I want to keep my select, INSERT & UPDATE statements, DML_select.sql will be for select specificly.


-- 1. Show all from "avdelning(DIDD)":
select * 
from larare 
where avdelning = 'DIDD'
;

-- 2. Show all where akronym starts with 'h':
select * 
from larare 
where akronym like 'h%'
;

-- 3. Show all where fornamn contains 'o':
select * 
from larare 
where fornamn like '%o%'
;

-- 4. Show all who earns between 30 000 - 50 000:
select * 
from larare 
where lon <= 50000
and lon >= 30000
;

-- 5. Show all where 'kompetens' is less then 7:
select *
from larare
where kompetens < 7
and lon > 40000
;

-- 6. Show 'sna', 'dum' and 'min':
select *
from larare
where akronym
in ('sna', 'dum', 'min')
;

-- 7. Show all with salary above 80 000 OR have kompetens 2 with avdelning ADM:
select *
from larare
where lon > 80000
or (kompetens = 2 and avdelning = 'ADM')
;

select
fornamn as 'Lärare',
lon as 'Lön'
from larare
;

select *
from larare
order by efternamn asc
;

select *
from larare
order by efternamn desc
;

select *
from larare
order by lon asc
;

select *
from larare
order by lon desc
;

select *
from larare
order by lon desc limit 3
;

select
    fornamn as 'Lärare',
    lon as 'Lön'
from larare
;
