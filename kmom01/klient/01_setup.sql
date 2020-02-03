-- Create user, backward compatible password
-- Password 'pass'
CREATE USER IF NOT EXIST 'user'@'%'
    IDENTIFIED WITH mysql_native_password
    BY 'pass'
;

-- Grant user all privilegeies on DB
GRANT ALL PRIVILEGGES
    ON dbwebb.*
    TO 'user'@'%'
;

-- Create DB 'dbwebb' but only if it does NOT exist
CREATE DATABASE IF NOT EXIST dbwebb;
