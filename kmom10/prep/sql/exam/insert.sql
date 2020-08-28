use exam;

delete from spelning;
delete from speldag;
delete from artist;
delete from landskod;

set global local_infile = 1;
show variables like 'local_infile';


-- spelning.
load data local infile 'spelning.csv'
into table spelning
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\r\n'
ignore 1 lines
;

-- show warnings;



-- speldag.
load data local infile 'speldag.csv'
into table speldag
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\r\n'
ignore 1 lines
;

-- show warnings;




-- artist.
load data local infile 'artist.csv'
into table artist
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\r\n'
ignore 1 lines
;

-- show warnings;




-- landskod.
load data local infile 'landskod.csv'
into table landskod
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\r\n'
ignore 1 lines
;

-- show warnings;
show tables;
select * from artist;
select * from landskod;
select * from spelning;
select * from speldag;

select * from v_show_all_info;
