drop table if exists logg;
drop table if exists organisation;
drop table if exists person;
drop table if exists kategori;

drop view if exists v_show_all_info;
-- drop view if exists v_search_information;
-- drop view if exists;

drop procedure if exists show_full_information;
drop procedure if exists search_information;
-- drop procedure if exists;

-- drop trigger if exists;

-- Teckenkodning:
set names 'utf8';

-- set foreign_key_checks = 0;

create table organisation
(
    id char(4) not null,
    namn varchar(30) not null,

    primary key (id)
);

create table person
(
    id char(5) not null,
    fornamn varchar(20) not null,
    efternamn varchar(20) not null,

    primary key (id)
);

-- create table
create table kategori
(
    typ varchar(20) not null,
    niva int not null,

    primary key (typ)
);

create table logg
(
    id int not null,
    kategori_typ varchar(20) not null,
    person_id char(5) not null,
    organisation char(4) not null,
    vad varchar(200) not null,

    primary key (id),
    foreign key (kategori_typ) references kategori(typ),
    foreign key (person_id) references person(id),
    foreign key (organisation) references organisation(id)
    on delete cascade
);

show tables;






    -- time_format(s.tid, '%H:%m') as tid,
    -- date_format(sd.datum, '%Y-%m-%d') as datum


create view v_show_all_info
as
select
    l.id as logg_id,
    l.person_id as person_id,
    concat(p.fornamn, " ", p.efternamn) as namn,
    concat(o.namn, " (", o.id, ")") as organisation,
    l.kategori_typ as kategori,
    k.niva as niva,
    l.vad as vad
from logg as l
    join organisation as o
        on l.organisation = o.id
    join person as p
        on l.person_id = p.id
    join kategori as k
        on l.kategori_typ = k.typ
    order by logg_id asc
;


delimiter $$
create procedure search_information(
    search_for varchar(150)
)
begin
select *
from v_show_all_info
    where 
        logg_id like search_for or
        person_id like search_for or
        namn like search_for or
        organisation like search_for or
        kategori like search_for or
        niva like search_for or
        vad like search_for;
end
$$
delimiter ;



delimiter $$
create procedure show_full_information()
begin
select
    *
from v_show_all_info;
end
$$
delimiter ;



show warnings;









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