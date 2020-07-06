-- Daniel Andersson, daap19
-- Databas @ BTH VT-20
-- Kmom 02 - Mer SQL övningar (skolan)
-- --------------------------------------------------



-- 1. Exercises with MIN / MAX:
-- --------------------------------------------------
-- 1.1 MAX(lon):
select
    max(lon) as toplon
from larare
;

-- 1.2 MIN(lon)
select 
    min(lon)
from larare
;



-- 2. Exercises with group by:
-- --------------------------------------------------
-- 2.1 Count teachers at department and sort by decending order.
select
    avdelning,
    count(avdelning)
from larare
group by avdelning
order by avdelning desc
;

-- 2.2 How much is each department paying in salaries every month.
select
    avdelning,
    sum(lon) as summa
from larare
group by avdelning
order by summa desc
;

-- 2.3 What is the average salary per department sorted descending order.
select
    avdelning,
    avg(lon) as medellonen
from larare
group by avdelning
order by medellonen desc
;

-- 2.4 How much is the average salary for women & men.
select
    kon,
    avg(lon) as medellon
from larare
group by kon
order by medellon desc
;



-- 3. Exercises with group by
-- --------------------------------------------------
-- 3.1 What is the average kompetense per department?
select 
    avdelning,
    avg(kompetens) as snittkompetens
from larare
group by avdelning
order by snittkompetens desc
;

-- 3.2 What is the average salary per department and per kompetens?
-- sorted by department and average salary.
select 
    avdelning,
    kompetens,
    round(avg(lon), 0) as snittlon,
    count(*) as antal
from larare
group by avdelning, kompetens, lon
order by avdelning, snittlon
;



-- 4. Exercises with having
-- --------------------------------------------------
-- Example 1.
select
    avdelning,
    round(avg(lon)) as snittlon,
    count(lon) as antal
from larare
group by avdelning
order by snittlon desc
;

-- Exercise 4.1 select department with avrage salary higher then 35000 with having.
select
    avdelning,
    round(avg(lon)) as snittlon,
    count(lon) as antal
from larare
group by avdelning
having snittlon > 35000
order by snittlon desc
;

-- Exercise 4.2 select department average salary if number of teachers are 3 or more.
select
    avdelning,
    round(avg(lon)) as snittlon,
    count(lon) as antal
from larare
group by avdelning
having antal > 2
order by snittlon desc
;



-- 5. where vs. having
-- --------------------------------------------------
-- Example 1.1 where
select
    avdelning,
    round(avg(lon)) as snittlon,
    count(lon) as antal
from larare
where kompetens = 1
group by avdelning
order by avdelning
;

-- Example 1.2 add having
select
    avdelning,
    round(avg(lon)) as snittlon,
    count(lon) as antal
from larare
where kompetens = 1
group by avdelning
having snittlon < 30000
order by avdelning
;



-- having Exercises
-- --------------------------------------------------
-- Exercise 5.1 select department, how many employees, the groups avrage salary and sort by department and avg.salary.
select
    avdelning,
    count(*) as antal,
    round(avg(lon), 0) as snittlon
from larare
group by avdelning
order by avdelning, snittlon
;

-- Exercise 5.2 select same as 5.1, add kompetens, group by department and kompetens, sort by department and avrage salery.
select
    avdelning,
    kompetens,
    count(*) as antal,
    round(avg(lon), 0) as snittlon
from larare
group by avdelning, kompetens
order by avdelning, kompetens desc
;

-- Exercise 5.3 select same as 5.2, add having kompetens max 3.
select
    avdelning,
    kompetens,
    count(*) as antal,
    round(avg(lon), 0) as snittlon
from larare
group by avdelning, kompetens
having kompetens < 4
order by avdelning, kompetens desc
;

-- Exercise 5.4 select same as 5.3 with a avrage salary of min 30000 and max 45000 also exclude all groups with more then 1 antal.
select
    avdelning,
    kompetens,
    count(*) as antal,
    round(avg(lon), 0) as snittlon
from larare
where kompetens < 4
group by avdelning, kompetens
having 
    snittlon >= 30000 and snittlon <= 45000 and 
    antal < 2
order by avdelning, kompetens desc
;
