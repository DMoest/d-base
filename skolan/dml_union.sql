-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: dml_union.sql
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.



-- Example of UNION
-- --------------------------------------------------
-- 1. Make the connection with UNION
select
    *,
    'after' as origin from larare
union
select
    *,
    'before' as origin from larare_pre
order by akronym
;

-- 2. Query selection from both tables to show before and after. The information is presented on two rows.
select
    lon.origin,
    akronym,
    fornamn,
    efternamn,
    kon,
    kompetens,
    lon
where
    akronym IN ('ala', 'dum')
order by akronym, origin
;
