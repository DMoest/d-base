-- This is a part of traing SQL in the course "Databas" and it will cover the basics of databases. 
-- Student Daniel Andersson - daap19 2020-02-07.

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
