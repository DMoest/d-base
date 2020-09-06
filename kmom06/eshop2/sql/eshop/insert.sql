-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: insert.sql
-- Module content: All insert into tables from CSV-files.

use eshop;

delete from products;
delete from product_types;
delete from inventory;
delete from customers;
delete from orders;



-- Set & Check for ability to load local infile:
set global local_infile = 1;
-- show variables like 'local_infile';



-- Products.
load data local infile 'eshop - products.csv'
into table products
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\n'
ignore 1 lines
;

-- show warnings;
-- select * from products;



-- Product types.
load data local infile 'eshop - categories.csv'
into table product_types
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\r\n'
ignore 1 lines
;

-- show warnings;
-- select * from product_types;



-- Inventory.
load data local infile 'eshop - inventory.csv'
into table inventory
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\r\n'
ignore 1 lines
;

-- show warnings;
-- select * from inventory;



-- Customers.
-- Insert TEST-customers.
load data local infile 'eshop - customers.csv'
into table customers
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\r\n'
ignore 1 lines
;

-- show warnings;
-- select * from customers;



-- Customer phones.
-- Insert TEST-customers.
load data local infile 'eshop - customer_phones.csv'
into table customer_phones
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\r\n'
ignore 1 lines
;

-- show warnings;
-- select * from customers;



-- Orders.
-- Insert TEST-orders.
load data local infile 'eshop - orders.csv'
into table orders
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\r\n'
ignore 1 lines
;

-- show warnings;
-- select * from orders;



-- Picking Lists.
-- Insert TEST-picking lists.
load data local infile 'eshop - picking_lists.csv'
into table picking_lists
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\r\n'
ignore 1 lines
;

-- show warnings;
-- select * from picking_lists;



-- Check trigger events for insert of products:
-- select * from log_products;
-- select * from log_orders;

-- Try to restore what was avoided before.
-- 
set foreign_key_checks = 1;
