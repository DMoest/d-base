-- This is a part of traing SQL in the course "Databas" and it will cover the basics of databases. Student Daniel Andersson - daap19 2020-02-07.

-- DDL (Data Definition Language) here I want to keep my CREATE, ALTER & DROP statements, DDL.sql will be for CREATING the table "larare".



-- Drop/Delete tabel if exists:
DROP TABLE IF EXISTS larare;

-- Create table "larare":
CREATE TABLE larare
(
	akronym CHAR(3),
    avdelning CHAR(4),
    fornamn VARCHAR(20),
    efternamn VARCHAR(20),
    kon CHAR(1),
    lon INT,
    fodd DATE,
    
    PRIMARY KEY (akronym)
);
