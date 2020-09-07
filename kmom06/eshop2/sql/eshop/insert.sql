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


-- Product pictures.
load data local infile 'eshop - product_pictures.csv'
into table product_pictures
charset utf8
fields
    terminated by ','
    enclosed by '"'
lines
    terminated by '\n'
ignore 1 lines
;


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


-- Customer phones.
-- Insert TEST-customers phone numbers.
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

set foreign_key_checks = 1;
