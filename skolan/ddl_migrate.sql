-- This is a part of traing SQL in the course "Databas" and it will cover the basics of databases. Student Daniel Andersson - daap19 2020-02-07.

-- DDL (Data Definition Language) here I want to keep my CREATE, ALTER & DROP statements, DDL_MIGRATE.sql will be for ALTER specificly.



-- Add column to table:
--
ALTER TABLE larare ADD COLUMN kompetens INT;

-- Remove/Drop specific column from table:
--
ALTER TABLE larare DROP COLUMN kompetens;

-- Add column to table with default value(not NULL):
ALTER TABLE larare 
ADD COLUMN kompetens INT NOT NULL DEFAULT 1;

SHOW COLUMNS FROM larare;
