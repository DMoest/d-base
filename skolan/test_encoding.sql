set names 'utf8';

drop table if exists person;
create table person
(
    fornamn VARCHAR(10)
);

insert into person values
("Örjan"), ("Börje"), ("Bo"), ("Øjvind"),
("Åke"), ("Åkesson"), ("Arne"), ("Ängla"),
("Ægir")
;


select * from person;

select * from person
    order by fornamn;

show create table person;

show charset like 'latin1';

show collation where charset = 'latin1';

show charset like 'utf8';

select hex("©");

alter table person convert to charset utf8 collate utf8_unicode_ci;

select * from person
    order by fornamn;

show collation where charset = 'utf8';

alter table person convert to charset utf8 collate utf8_swedish_ci;

select * from person
    order by fornamn;
