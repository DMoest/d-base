-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: ddl_migrate.sql
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.

-- DDL (Data Definition Language) here I want to keep my CREATE, ALTER & DROP statements, DDL_MIGRATE.sql will be for ALTER specificly.



-- Add column to table:
--
alter table larare add column kompetens int;

-- Remove/Drop specific column from table:
--
alter table larare drop column kompetens;

-- Add column to table with default value(not NULL):
alter table larare
add column kompetens int not null default 1;

show columns from larare;
