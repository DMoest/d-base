-- This is a part of traing SQL in the course "Databas" and it will cover the basics of databases. 
-- Student Daniel Andersson - daap19 2020-02-07.

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
