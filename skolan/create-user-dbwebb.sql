-- This is a part of traing SQL in the course "Databas" and it will cover the basics of databases. 
-- Student Daniel Andersson - daap19 2020-02-07.

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
