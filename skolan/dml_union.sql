-- Daniel Andersson, daap19
-- Databas @ BTH VT-20
-- Kmom 02 - Mer SQL övningar (skolan)
-- --------------------------------------------------



-- Example of UNION
-- --------------------------------------------------
-- 1. Make the connection with UNION
SELECT
    *,
    'after' AS origin FROM larare
UNION
SELECT
    *,
    'before' AS origin FROM larare_pre
ORDER BY akronym
;


-- 2. Query selection from both tables to show before and after. The information is presented on two rows.
SELECT
    lon.origin,
    akronym,
    fornamn,
    efternamn,
    kon,
    kompetens,
    lon
WHERE
    akronym IN ('ala', 'dum')
ORDER BY akronym, origin
;
