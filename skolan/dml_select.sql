-- This is a part of traing SQL in the course "Databas" and it will cover the basics of databases. Student Daniel Andersson - daap19 2020-02-07.

-- DML (Data Manipulation Language) here I want to keep my SELECT, INSERT & UPDATE statements, DML_SELECT.sql will be for SELECT specificly.


-- 1. Show all from "avdelning(DIDD)":
SELECT * 
FROM larare 
WHERE avdelning = 'DIDD'
;

-- 2. Show all where akronym starts with 'h':
SELECT * 
FROM larare 
WHERE akronym LIKE 'h%'
;

-- 3. Show all where fornamn contains 'o':
SELECT * 
FROM larare 
WHERE fornamn LIKE '%o%'
;

-- 4. Show all who earns between 30 000 - 50 000:
SELECT * 
FROM larare 
WHERE lon <= 50000
AND lon >= 30000
;

-- 5. Show all where 'kompetens' is less then 7:
SELECT *
FROM larare
WHERE kompetens < 7
AND lon > 40000
;

-- 6. Show 'sna', 'dum' and 'min':
SELECT *
FROM larare
WHERE akronym
IN ('sna', 'dum', 'min')
;

-- 7. Show all with salary above 80 000 OR have kompetens 2 with avdelning ADM:
SELECT *
FROM larare
WHERE lon > 80000
OR (kompetens = 2 AND avdelning = 'ADM')
;

SELECT
fornamn AS 'Lärare',
lon AS 'Lön'
FROM larare
;

SELECT *
FROM larare
ORDER BY efternamn ASC
;

SELECT *
FROM larare
ORDER BY efternamn DESC
;

SELECT *
FROM larare
ORDER BY lon ASC
;

SELECT *
FROM larare
ORDER BY lon DESC
;

SELECT *
FROM larare
ORDER BY lon DESC LIMIT 3
;

SELECT
    fornamn AS 'Lärare',
    lon AS 'Lön'
FROM larare
;
