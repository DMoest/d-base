-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: ddl_all.sql
-- Module content: All DDLs for the database, tables & views.
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.

-- Drop tabels if exists:
drop table if exists kurstillfalle;
drop table if exists kurs;
drop table if exists larare_pre;
drop table if exists larare;

-- Drop views if exists:
drop view if exists v_planering;
drop view if exists v_lonerevision;
drop view if exists v_larare;
drop view if exists v_name_alder;


-- Create TABLEs:
--
-- table 1 (Lärare):
create table larare
(
	akronym char(3) not null,
    avdelning char(4) not null,
    fornamn varchar(20) not null,
    efternamn varchar(20) not null,
    kon char(1) not null,
    kompetens int not null default 1,
    lon int,
    fodd date not null,

    primary key (akronym)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;



-- table 2 (Lärare Pre Lönerev.):
create table larare_pre
    like larare;



-- table 3 (Kurs):
create table kurs
(
    kod char(6) not null,
    namn varchar(40) not null,
    poang float not null,
    niva char(3) not null,

    primary key (kod)
)
engine innodb
charset utf8
collate utf8_swedish_ci;



-- table 4 (Kurstillfälle):
create table kurstillfalle
(
    id int auto_increment not null,
    kurskod char(6) not null,
    kursansvarig char(3) not null,
    lasperiod int not null,

    primary key (id),
    foreign key (kurskod) references kurs(kod),
    foreign key (kursansvarig) references larare(akronym)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;



-- Create VIEWs --
--
-- view 1:
create view v_name_alder
as
select
    concat(fornamn, ' ', efternamn, ' (', lower(avdelning), ')') as Namn,
    timestampdiff(year, fodd, curdate()) as alder
from larare
;



-- view 2:
create view v_larare
as
select
    akronym,
    avdelning,
    fornamn,
    efternamn,
    kon,
    lon,
    fodd,
    timestampdiff(year, fodd, curdate()) as alder
from larare
;



-- view 3:
create view v_lonerevision
as
select
    l.akronym,
    concat(l.fornamn, ' ', l.efternamn) as namn,
    p.lon as "pre-lonerev.",
    l.lon as "lon-nu",
    l.lon - p.lon as diff,
    round(((l.lon - p.lon) / p.lon) * 100, 2) as procent,
    case when round(((l.lon - p.lon) / p.lon) * 100, 2) < 3.00 then 'not ok'
        else 'ok' end as mini
from larare as l
    join larare_pre as p
        on l.akronym = p.akronym
order by procent desc
;



-- view 4:
create view v_planering
as
select *
from kurs as k
    join kurstillfalle as kt
        on k.kod = kt.kurskod
    join larare as l
        on l.akronym = kt.kursansvarig
order by k.namn asc
;
