-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: ddl_copy.sql
-- Module content: ddl copy.
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.



-- COPY table:
-- --------------------------------------------------
drop table if exists larare_pre;
create table larare_pre like larare;
insert into larare_pre select * from larare;

select sum(lon) as 'lonesumma', sum(kompetens) as kompetens from larare;
select sum(lon) as 'lonesumma', sum(kompetens) as kompetens from larare_pre;
