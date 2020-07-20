-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: create-user-dbwebb.sql
-- Module content: Create database, grant privileges, show MySQL version.
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.

-- DDL (Data Definition Language) here I want to keep my CREATE, ALTER & DROP statements.


drop user if exists 'dbwebb'@'%';

create user if not exists 'dbwebb'@'%'
identified
with mysql_native_password -- Only MySQL > 8.0.4
by 'password'
;

grant all privileges
on *.*
to 'dbwebb'@'%'
with grant option -- Enables the user to GRANT other users privileges.
;

-- Check which version of MySQL you have:
show variables like "%version%";

-- Check status for users root, dbwebb and user:
select
    user,
    host,
    grant_priv,
    plugin
from mysql.user
where
    user in ('root', 'dbwebb', 'user')
order by user
;
