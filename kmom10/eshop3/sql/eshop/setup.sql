-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: setup.sql
-- Module content: Check MySQL version. Create Database "eshop". Create users and passwords. Grant privileges for users. Show 



-- MySQL VERSION:
-- 1. --------------------------------------------------
-- Show version of MySQL before start.
show variables like "%version%";

-- Database:
-- 2. --------------------------------------------------
-- Create the database.
create database if not exists eshop;

-- Use the database.
use eshop;

-- Users:
-- 3. --------------------------------------------------
-- Drop the user before recreate the user.
drop user if exists 'user'@'%';

-- Create the user with backwards version compatible password identification.
create user if not exists 'user'@'%'
identified
    with mysql_native_password
    by 'pass'
;

-- Grant privileges to database for the user.
grant all privileges
    on *.*
    to 'user'@'%'
    -- with grant option -- can give/grant privileges to other users.
;
