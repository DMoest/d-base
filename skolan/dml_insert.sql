-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: dml_insert.sql
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.

-- DML (Data Manipulation Language) here I want to keep my SELECT, INSERT & UPDATE statements, DML_INSERT.sql will be for INSERT specificly.

use skolan;

-- Delete before insert:
delete from larare;

-- Add teachers to table larare one at the time:
insert into larare values ('sna', 'DIPT', 'Severus', 'Snape', 'M', 40000, '1951-05-01');
insert into larare values ('dum', 'ADM', 'Albus', 'Dumbledore', 'M', 80000, '1941-04-01');
insert into larare values ('min', 'DIDD', 'Minerva', 'McGonagall', 'K', 40000, '1955-05-05');

-- Add multiple teachers to larare with one statement:
insert into larare values
    ('hag', 'ADM', 'Hagrid', 'Rubeus', 'M', 25000, '1956-05-06'),
    ('fil', 'ADM', 'Argus', 'Filch', 'M', 25000, '1946-04-06'),
    ('hoc', 'DIDD', 'Madam', 'Hooch', 'K', 35000, '1948-04-08')
;

-- Add multiple teachers to larare with one statement specified what value goes into what column:
-- Since salary(lon) does not have a specified value ti insert the value will be NULL.
insert into larare
	(akronym, avdelning, fornamn, efternamn, kon, fodd)
values
	('gyl', 'DIPT', 'Gyllenroy', 'Lockman', 'M', '1952-05-02'),
    ('ala', 'DIPT', 'Alastor', 'Moody', 'M', '1943-04-03')
;

select * from larare order by akronym asc;
