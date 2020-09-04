-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: functions.sql
-- Module content: All SQL functions.

create database if not exists experiment;

-- Use the database.
use experiment;

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


drop table if exists exam;

create table exam
(
    `acronym` char(4) primary key,
    `score` integer
);

insert into exam
values
    ('adam', 77),
    ('ubbe', 52),
    ('june', 49),
    ('john', 63),
    ('meta', 97),
    ('siva', 88);

select * from exam;

drop function if exists grade;

delimiter $$

create function grade(
    score integer
)
returns integer
deterministic
begin
    return score;
end
$$

delimiter ;

select
    *,
    grade(score) as 'grade'
from exam;

drop function if exists grade;
delimiter $$

create function grade(
    score integer
)
returns char(2)
deterministic
begin
    if score >= 90 then
        return 'A';
    elseif score >= 80 then
        return 'B';
    elseif score >= 70 then
        return 'C';
    elseif score >= 60 then
        return 'D';
    elseif score >= 55 then
        return 'E';
    elseif score >= 50 then
        return 'FX';
    end if;
    return 'F';
end
$$

delimiter ;

select
    *,
    grade(score) as `grade`
from exam
order by grade;



drop function if exists grade2;

delimiter $$
create function grade2(
    score integer
)
returns char(1)
deterministic
begin
    if score >= 90 then
        return '5';
    elseif score >= 70 then
        return '4';
    elseif score >= 55 then
        return '3';
    end if;
    return 'U';
end
$$
delimiter ;

select
    *,
    grade(score) as 'A-F, FX',
    grade2(score) as 'U, 3-5'
from exam
order by score desc;



drop function if exists time_of_the_day;
delimiter $$
create function time_of_the_day()
returns datetime
not deterministic no sql
begin
    return now();
end
$$

delimiter ;



-- SHOW FUNCTION STATUS;
show function status where db = 'experiment';
