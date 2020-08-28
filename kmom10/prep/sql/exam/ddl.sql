drop table if exists spelning;
drop table if exists speldag;
drop table if exists artist;
drop table if exists landskod;

drop view if exists v_show_all_info;
drop view if exists v_show_info_alt;
-- drop view if exists;

drop procedure if exists show_all_artist;
-- drop procedure if exists;

-- drop trigger if exists;

-- Teckenkodning:
set names 'utf8';

-- set foreign_key_checks = 0;

create table landskod
(
    `kod` char(3) not null,
    `namn` varchar(10) not null,

    primary key (kod)
);

-- create table
create table artist
(
    id char(3) not null,
    namn varchar(25) not null,
    ort varchar(25) not null,
    landskod char(3) not null,

    primary key (id),
    foreign key (landskod) references land(kod)
    on delete cascade
);

create table speldag
(
    id int not null,
    namn varchar(20) not null,
    datum date not null,

    primary key (id)
    
);

create table spelning
(
    artist char(3) not null,
    dag int not null,
    tid time not null,

    primary key (artist, dag),
    foreign key (artist) references artist(id),
    foreign key (dag) references speldag(id)
);

show tables;





create view v_show_all_info
as
select
    a.id,
    a.namn as artist,
    a.ort,
    concat(lk.namn, " (", lk.kod, ")") as land,
    s.artist as upptrader,
    sd.namn as dag,
    time_format(s.tid, '%H:%m') as tid,
    date_format(sd.datum, '%Y-%m-%d') as datum
from artist as a
    join landskod as lk
        on a.landskod = lk.kod
    left outer join spelning as s
        on a.id = s.artist
    left outer join speldag as sd
        on s.dag = sd.id
order by datum, tid asc
;



-- create view v_show_info_alt
-- as
-- select
--     a.namn as artist,
--     concat(a.ort, "/", lk.namn, " (", lk.kod, ")") as ort,
--     sd.namn as dag,
--     date_format(sd.datum, '%d %D') as Spelning,
--     time_format(s.tid, '%H:%m') as tid
-- from artist as a
--     join landskod as lk
--         on a.landskod = lk.kod
--     right outer join speldag as sd
--         on s.dag = sd.id
--     left outer join spelning as s
--         on a.id = s.artist
-- order by datum, tid asc
-- ;



delimiter $$
create procedure show_all_artist()
begin
select
    *
from v_show_all_info;
end
$$
delimiter ;



show warnings;