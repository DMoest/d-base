-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: insert.sql
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.

-- Select Database to use:
use skolan;

-- delete before insert:
delete from larare_pre;
delete from larare;



-- add teacher to table "larare" one at the time:
insert into larare
    (akronym, avdelning, fornamn, efternamn, kon, kompetens, lon, fodd)
values
    ('sna', 'DIPT', 'Severus', 'Snape', 'M', 1, 40000, '1951-05-01'),
    ('dum', 'ADM', 'Albus', 'Dumbledore', 'M', 1, 80000, '1941-04-01'),
    ('min', 'DIDD', 'Minerva', 'McGonagall', 'K', 1, 40000, '1955-05-05'),
    ('hag', 'ADM', 'Hagrid', 'Rubeus', 'M', 1, 25000, '1956-05-06'),
    ('fil', 'ADM', 'Argus', 'Filch', 'M', 1, 25000, '1946-04-06'),
    ('hoc', 'DIDD', 'Madam', 'Hooch', 'K', 1, 35000, '1948-04-08'),
    ('gyl', 'DIPT', 'Gyllenroy', 'Lockman', 'M', 1, null, '1952-05-02'),
    ('ala', 'DIPT', 'Alastor', 'Moody', 'M', 1, null, '1943-04-03')
;



-- Update to default 'lon' as 30000 where NULL:
update larare
    set
        lon = 30000
    where
        lon is null
;



-- Insert from 'larare' into 'larare_pre':
insert into larare_pre (select * from larare);



-- Show tables larare & larare_pre after inserted values
select * from larare order by akronym asc;
select * from larare_pre order by akronym asc;
