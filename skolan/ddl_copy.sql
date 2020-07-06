-- Daniel Andersson, daap19
-- Databas @ BTH VT-20
-- Kmom 02 - Mer SQL övningar (skolan)
-- --------------------------------------------------



-- COPY table:
-- --------------------------------------------------
drop table if exists larare_pre;
create table larare_pre like larare;
insert into larare_pre select * from larare;

select sum(lon) as 'lonesumma', sum(kompetens) as kompetens from larare;
select sum(lon) as 'lonesumma', sum(kompetens) as kompetens from larare_pre;
