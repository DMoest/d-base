-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: ddl_delete.sql
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.

-- DML (Data Manipulation Language) here I want to keep my SELECT, INSERT & UPDATE statements, DML_DELETE.sql will be for DELETE specificly.



-- Detele a row from table in larare:
delete from larare where fornamn = 'Hagrid';

-- Delete all who work in the department DIPT(avdelning):
delete from larare where "avdelning" = 'DIPT';

-- delete from larare who have "lon" but limit to 2 rows:
delete from larare where lon limit 2;

-- Delete all from larare:
delete from larare;

select * from larare;
