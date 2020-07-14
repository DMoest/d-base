-- This is a part of traing SQL in the course "Databas" and it will cover the basics of databases. 
-- Student Daniel Andersson - daap19 2020-07-14.

set names 'utf8';

drop table if exists kurstillfalle;
drop table if exists kurs;

alter table larare convert to charset utf8 collate utf8_swedish_ci;
alter table larare_pre convert to charset utf8 collate utf8_swedish_ci;

-- Create 'Kurs'
create table kurs
(
    kod char(6) not null,
    namn varchar(40),
    poang float,
    niva char(3),

    primary key (kod)
)
charset utf8 collate utf8_swedish_ci;

select * from kurs;



-- Create 'Kurstillfallen'
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


select * from kurstillfalle;
