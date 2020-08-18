-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: setup.sql
-- Module content: Database init with users and passwords. Privileges for users are granted.

create database if not exists eshop;
use eshop;

show databases like "%eshop%";

drop user if exists 'user'@'%';

create user if not exists 'user'@'%'
identified
    with mysql_native_password
    by 'pass'
;

grant all privileges
    on *.*
    to 'user'@'%'
;

-- show grants for 'user'@%'%';
