-- This is a part of traing SQL in the course "Databas" and it will cover the basics of databases. Student Daniel Andersson - daap19 2020-02-07.

-- DDL (Data Definition Language) here I want to keep my CREATE, ALTER & DROP statements.



DROP USER IF EXISTS 'dbwebb'@'%';

CREATE USER IF NOT EXISTS 'dbwebb'@'%'
IDENTIFIED
WITH mysql_native_password -- Only MySQL > 8.0.4
BY 'password'
;

GRANT ALL PRIVILEGES
ON *.*
TO 'dbwebb'@'%'
WITH GRANT OPTION -- Enables the user to GRANT other users privileges.
;

-- Check which version of MySQL you have:
SHOW VARIABLES LIKE "%version%";

-- Check status for users root, dbwebb and user:
SELECT
    User,
    Host,
    Grant_priv,
    plugin
FROM mysql.user
WHERE
    User IN ('root, 'dbwebb', 'user')
ORDER BY User
;
