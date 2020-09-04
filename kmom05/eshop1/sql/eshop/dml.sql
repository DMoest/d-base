-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: dml.sql
-- Module content: All DML to check/test things from ddl.sql.



-- MySQL VERSION:
-- 1. --------------------------------------------------
-- Show version of MySQL before start.
show variables like "%version%";



-- SETUP 
-- 2. --------------------------------------------------
-- DATABASE - Show, Select & Describe
-- -----------------------------------------------------
-- Show the database like "%eshop". (% = wildcard/joker sign, stringmatching.)
show databases like "%eshop%";

-- Show users & granted privileges:
-- 3. --------------------------------------------------
-- Select users root & user from mysql.user.
SELECT
    User,
    Host,
    Grant_priv,
    plugin
FROM mysql.user
WHERE
    User IN ('root', 'user')
ORDER BY User
;

show grants for current_user;
-- show grants for 'user'@%'%';
-- Show granted privileges for current user;



-- *** DDL ***
-- 4. --------------------------------------------------
-- TABLEs - Show, Select & Describe
-- -----------------------------------------------------
show tables;

describe products;
-- show create table products \G;

describe product_types;
-- show create table product_types \G;

describe product_pictures;
-- show create table product_pictures \G;

describe inventory;
-- show create table inventory \G;

describe customers;
-- show create table customers \G;

describe picking_list;
-- show create table picking_list \G;

describe products_to_picking_list;
-- show create table products_to_picking_list \G;

describe orders;
-- show create table orders \G;

describe order_from_customer;
-- show create table order_from_customer \G;

describe customer_phones;
-- show create table customer_phones \G;

describe invoices;
-- show create table invoices \G;

describe log_products;
-- show create table log_products \G;



-- *** DDL ***
-- 5. --------------------------------------------------
-- VIEWs - Show, Select & Describe
-- -----------------------------------------------------
describe v_products;
describe v_product_categories;
describe v_inventory;
describe v_log_products;

-- *** DDL ***
-- 6. --------------------------------------------------
-- PROCEDUREs - Show, Select & Describe
-- -----------------------------------------------------
-- show create procedure get_all_from_table;
-- show create procedure show_product;
-- show create procedure show_product_categories;
-- show create procedure create_product;
-- show create procedure update_product;
-- show create procedure delete_product;
-- show create procedure show_inventory;
-- show create procedure search_inventory;
-- show create procedure show_all_shelves;
-- show create procedure position_product_on_shelf;
-- show create procedure remove_product_from_shelf;
-- show create procedure show_rows_from_product_log;
-- show create procedure show_rows_from_product_log;

show warnings;
