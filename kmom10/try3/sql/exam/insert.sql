use exam;

delete from kategori;
delete from person;
delete from organisation;
delete from logg;

set global local_infile = 1;
show variables like 'local_infile';


-- kategori.
load data local infile 'kategori.csv'
into table kategori
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\r\n'
ignore 1 lines
;

-- person.
load data local infile 'person.csv'
into table person
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\r\n'
ignore 1 lines
;

-- organisation.
load data local infile 'organisation.csv'
into table organisation
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\r\n'
ignore 1 lines
;

-- logg.
load data local infile 'logg.csv'
into table logg
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\r\n'
ignore 1 lines
;

show tables;
select * from kategori;
select * from person;
select * from organisation;
select * from logg;

show warnings;
