-- Daniel Andersson, daap19
-- Databas @ BTH VT-20
-- Kmom 02 - Mer SQL övningar (skolan)
-- --------------------------------------------------



-- Examples with views:
-- --------------------------------------------------
-- Example 1 - without a view
select
    concat(fornamn, ' ', efternamn, ' (', lower(avdelning), ')') as Namn,
        timestampdiff(year, fodd, curdate()) as alder
    from larare;

-- Example 2 - with a view
drop view if exists v_name_alder;

create view v_name_alder
as
select
    concat(fornamn, ' ', efternamn, ' (', lower(avdelning), ')') as Namn,
    timestampdiff(year, fodd, curdate()) as alder
from larare
;

select * from v_name_alder;



-- 1. Exercises with views:
-- --------------------------------------------------
-- 1.1 create view that hold all columns from teachers and one that tells the age.
drop view if exists v_larare;

create view v_larare
as
select
    akronym,
    avdelning,
    fornamn,
    efternamn,
    kon,
    lon,
    fodd,
    timestampdiff(year, fodd, curdate()) as alder
from larare
;

-- 1.2 select from the view in 1.1 
select
    avdelning,
    ROUND(AVG(alder), 0) as medelalder
from v_larare
group by avdelning
order by medelalder desc
;
