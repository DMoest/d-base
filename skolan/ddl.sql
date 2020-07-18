-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: ddl.sql
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.


-- DDL (Data Definition Language) here I want to keep my CREATE, ALTER & DROP statements, DDL.sql will be for CREATING the table "larare".


-- Drop/Delete tabel if exists:
drop table if exists larare;

-- Create table "larare":
create table larare
(
	akronym char(3),
    avdelning char(4),
    fornamn varchar(20),
    efternamn varchar(20),
    kon char(1),
    lon int,
    fodd date,
    
    primary key (akronym)
);
