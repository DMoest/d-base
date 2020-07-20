-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: dml_update.sql
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.

-- DML (Data Manipulation Language) here I want to keep my SELECT, INSERT & UPDATE statements, DML_UPDATE.sql will be for UPDATE specificly.



-- Update a column value:
-- UPDATE larare SET lon = 30000 WHERE akronym = 'gyl';

-- Alternative 1 - Set the once we know have "lon" NULL:
-- UPDATE larare
--     SET
--         lon = 30000
--     WHERE
--         akronym = IN ('gyl', 'ala')
-- ;

-- Alternativ 2 - Set where NULL is the value for column "lon":
-- I choose this, it is more helpfull if I did not have know where "lon" is NULL.
update larare
    set
        lon = 30000
    where
        lon is null
;

-- Check selected columns ordered by lon descending order:
select akronym, avdelning, fornamn, kon, lon, kompetens
    from larare
    order by lon desc;
