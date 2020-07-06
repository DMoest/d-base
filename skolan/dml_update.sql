-- This is a part of traing SQL in the course "Databas" and it will cover the basics of databases. Student Daniel Andersson - daap19 2020-02-07.

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
