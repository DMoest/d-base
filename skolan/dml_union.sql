-- Daniel Andersson, daap19
-- Databas @ BTH VT-20
-- Kmom 02 - Mer SQL övningar (skolan)
-- --------------------------------------------------



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
