-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: dml_insert_csv.sql
-- Module content: DML for import/export from csv-files.
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.



-- Delete TABLEs, order depending on foreign key constraints:
delete from kurstillfalle;
delete from kurs;



-- Enable load data local infile on server:
set global local_infile = 1;
show variables like 'local_infile';



-- Insert into kurs:
load data local infile 'kurs.csv'
into table kurs
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\n'
ignore 1 lines
;

select * from kurs;


-- Insert into kurstillfalle:
load data local infile 'kurstillfalle.csv'
into table kurstillfalle
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\n'
ignore 1 lines
(kurskod, kursansvarig, lasperiod)
;

select * from kurstillfalle;
