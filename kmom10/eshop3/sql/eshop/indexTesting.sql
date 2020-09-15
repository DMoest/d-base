-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: dml.sql
-- Module content: Testing for index optimization.



-- show all tables in eshop:
show tables;


-- Work with products:
show index from customers;


-- select type, match(type) against ('Bad* byx*' in boolean mode) as matching from customers order by matching desc;

explain select * from customers where firstname like 'and%';

show index from customers;
explain customers;
show create table customers \G;




show warnings;
