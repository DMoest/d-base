-- This is a part of traing SQL in the course "Databas" and it will cover the basics of databases. Student Daniel Andersson - daap19 2020-02-07.

-- Setup.sql is intenden to recreate/reset/do over if something went wrong.



-- Create a database and use it:
CREATE DATABASE IF NOT EXISTS skolan;
USE skolan;

-- Erase the database and delete all content:
--
-- DROP DATABASE skolan;

-- Show which databases exists:
--
-- SHOW DATABASES;

-- Show which databases exists and have a name LIKE "skolan":
SHOW DATABASES LIKE "%skolan%";

-- Create a user with password "pass" and user can login from host "@'%'":
CREATE USER IF NOT EXISTS 'user'@'%'
IDENTIFIED
BY 'pass'
;

-- Create a user with backwards compatible password algoritm:
--
-- CREATE USER IF NOT EXISTS 'user'@'%'
-- IDENTIFIED
-- WITH mysql_native_password -- MySQL with version > 8.0.4
-- BY 'pass'
-- ;

-- Drop/delete a user:
--
-- DROP USER 'user'@'%';
-- DROP USER IF EXISTS 'user'@'%';

-- Give user all privileges on specific database:
GRANT ALL PRIVILEGES
	ON skolan.*
	TO 'user'@'%'
;

-- Show what priveleges is granted to specific user:
SHOW GRANTS FOR 'user'@'%';

-- Show granted privleges to current user:
--
-- SHOW GRANTS FOR CURRENT_USER;

