-- This is a part of traing SQL in the course "Databas" and it will cover the basics of databases. Student Daniel Andersson - daap19 2020-02-07.

-- Setup.sql is intenden to recreate/reset/do over if something went wrong.



-- Create a database and use it:
create database if not exists skolan;
use skolan;

-- Erase the database and delete all content:
--
-- DROP DATABASE skolan;

-- Show which databases exists:
--
-- SHOW DATABASES;

-- Show which databases exists and have a name LIKE "skolan":
show databases like "%skolan%";

-- Create a user with password "pass" and user can login from host "@'%'":
-- CREATE USER IF NOT EXISTS 'user'@'%'
-- IDENTIFIED
-- BY 'pass'
-- ;

-- Create a user with backwards compatible password algoritm:

drop user if exists 'user'@'%';
--
create user if not exists 'user'@'%'
identified
with mysql_native_password -- MySQL with version > 8.0.4
by 'pass'
;

-- Drop/delete a user:
--
-- DROP USER 'user'@'%';
-- DROP USER IF EXISTS 'user'@'%';

-- Give user all privileges on specific database:
grant all privileges
    on *.*
    to 'user'@'%'
;

-- Show what priveleges is granted to specific user:
show grants for 'user'@'%';

-- Show granted privleges to current user:
-- DROP USER IF EXISTS 'user'@'%';
-- SHOW GRANTS FOR CURRENT_USER;
