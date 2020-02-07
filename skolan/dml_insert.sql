-- This is a part of traing SQL in the course "Databas" and it will cover the basics of databases. Student Daniel Andersson - daap19 2020-02-07.

-- DML (Data Manipulation Language) here I want to keep my SELECT, INSERT & UPDATE statements, DML_INSERT.sql will be for INSERT specificly.

USE skolan;

-- Delete before insert:
DELETE FROM larare;

-- Add teachers to table larare one at the time:
INSERT INTO larare VALUES ('sna', 'DIPT', 'Severus', 'Snape', 'M', 40000, '1951-05-01');
INSERT INTO larare VALUES ('dum', 'ADM', 'Albus', 'Dumbledore', 'M', 80000, '1941-04-01');
INSERT INTO larare VALUES ('min', 'DIDD', 'Minerva', 'McGonagall', 'K', 40000, '1955-05-05');

-- Add multiple teachers to larare with one statement:
INSERT INTO larare VALUES
    ('hag', 'ADM', 'Hagrid', 'Rubeus', 'M', 25000, '1956-05-06'),
    ('fil', 'ADM', 'Argus', 'Filch', 'M', 25000, '1946-04-06'),
    ('hoc', 'DIDD', 'Madam', 'Hooch', 'K', 35000, '1948-04-08')
;

-- Add multiple teachers to larare with one statement specified what value goes into what column:
-- Since salary(lon) does not have a specified value ti insert the value will be NULL.
INSERT INTO larare
	(akronym, avdelning, fornamn, efternamn, kon, fodd)
VALUES
	('gyl', 'DIPT', 'Gyllenroy', 'Lockman', 'M', '1952-05-02'),
    ('ala', 'DIPT', 'Alastor', 'Moody', 'M', '1943-04-03')
;

SELECT * FROM larare ORDER BY akronym ASC;
