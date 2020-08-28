-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: ddl.sql
-- Module content: All DDLs for the database, tables, views, stored procedures & triggers.



-- --------------------------------------------------
-- * DROP FIRST IF EXISTS!                          *
-- --------------------------------------------------

-- Drop tabels if exists:
drop table if exists log_products;
drop table if exists invoices;
drop table if exists order_from_customer;
drop table if exists orders;
drop table if exists customer_phones;
drop table if exists customers;
drop table if exists products_to_picking_list;
drop table if exists picking_list;
drop table if exists product_types;
drop table if exists product_pictures;
drop table if exists inventory;
drop table if exists products;

-- Drop views if exists:
drop view if exists v_products;
drop view if exists v_product_categories;
drop view if exists v_inventory;
drop view if exists v_log_products;

-- Drop procedures if exists:
drop procedure if exists get_all_from_table;
drop procedure if exists show_all_products;
drop procedure if exists show_product;
drop procedure if exists show_product_categories;
drop procedure if exists create_product;
drop procedure if exists update_product;
drop procedure if exists delete_product;
drop procedure if exists show_inventory;
drop procedure if exists search_inventory;
drop procedure if exists show_all_shelves;
drop procedure if exists position_product_on_shelf;
drop procedure if exists remove_product_from_shelf;
drop procedure if exists show_full_product_log;
drop procedure if exists show_rows_from_product_log;

-- Drop trigger if exists:
drop trigger if exists log_product_insert;
drop trigger if exists log_product_update;
drop trigger if exists log_product_delete;

-- Teckenkodning:
set names 'utf8';


-- Bad idea?
set foreign_key_checks = 0;


-- --------------------------------------------------
-- * TABLES:                                        *
-- --------------------------------------------------

-- Products:
create table products
(
    `id` int auto_increment not null,
    `name` varchar(30) not null,
    `info` varchar(500) not null,
    `price` decimal(10, 2) not null,

    primary key (id)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- describe products;
-- show create table products \G;



-- Product types:
create table product_types
(
    `id` int not null auto_increment,
    `product` int not null,
    `type` varchar(30) not null,

    primary key (id),
    foreign key (product) references products(id)
    on delete cascade
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- describe product_types;
-- show create table product_types \G;



-- Product pictures:
create table product_pictures
(
    `id` int not null auto_increment,
    `product` int not null,
    `picture` varchar(30) not null,
    `description` varchar(100) not null,

    primary key (id),
    foreign key (product) references products(id)
    on delete cascade
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- describe product_pictures;
-- show create table product_pictures \G;



-- Inventory:
create table inventory
(
    `id` int not null auto_increment,
    `section` char(2) not null default 'AA',
    `position` char(2) not null default '01',
    `level` char(2) not null default '01',
    `product` int not null default 0,
    `amount` int not null default 0,

    primary key (id),
    foreign key (product) references products(id)
    on delete cascade
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- describe inventory;
-- show create table inventory \G;



-- Customers:
create table customers
(
    `id` int unique auto_increment not null,
    `firstname` varchar(20) not null,
    `lastname` varchar(20) not null,
    `street` varchar(20) not null,
    `number` varchar(6) not null,
    `post_code` varchar(10) not null,
    `city` varchar(25) not null,
    `country` varchar(25) not null,
    `email` varchar(40) not null,
    `birthday` date not null,

    primary key (id)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- describe customers;
-- show create table customers \G;


-- Picking_list:
create table picking_list
(
    `id` int not null auto_increment,
    `index` int unique not null,
    `product` int not null,
    `name` varchar(30) not null,
    `position` int not null,
    `amount` int not null,

    primary key (id),
    foreign key (id) references products(id),
    foreign key (position) references inventory(id)
    on delete cascade
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- describe picking_list;
-- show create table picking_list \G;


-- Products_to_picking_list:
create table products_to_picking_list
(
    `picking_list` int not null,
    `id` int not null,
    `amount` int not null,

    primary key (picking_list),
    foreign key (id) references products(id)
    on delete cascade
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- describe products_to_picking_list;
-- show create table products_to_picking_list \G;



-- Orders:
create table orders
(
    `id` int unique not null,
    `customer` int not null,
    `picking_list` int not null,
    `date` date not null,
    `status` varchar(20) not null,

    primary key (id),
    foreign key (customer) references customers(id),
    foreign key (picking_list) references picking_list(id)
    on delete cascade
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- describe orders;
-- show create table orders \G;


-- Orders from customers:
create table order_from_customer
(
    `id` int unique not null,
    `customer` int not null,

    primary key (id),
    foreign key (customer) references customers(id)
    on delete cascade
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- describe order_from_customer;
-- show create table order_from_customer \G;



-- Customer_phones:
create table customer_phones
(
    `id` int not null,
    `phone` int unique not null,

    primary key (id)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- describe customer_phones;
-- show create table customer_phones \G;



-- Invoices:
create table invoices
(
    `id` int unique not null,
    `order_id` int not null,
    `customer` int not null,
    `product_list` int not null,
    `adress` varchar(30) not null,
    `status` varchar(20) not null,

    primary key (id),
    foreign key (order_id) references orders(id),
    foreign key (customer) references customers(id),
    foreign key (product_list) references picking_list(id)
    on delete cascade
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- describe invoices;
-- show create table invoices \G;



-- Activity LOG:
create table log_products
(
    `id` int unique auto_increment not null,
    `product` int not null,
    `time` time not null,
    `date` date not null,
    `activity` varchar(200) not null,
    `before` varchar(250) not null,
    `after` varchar(250) not null
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- describe log_products;
-- -- show create table log_products \G;

show tables;







-- --------------------------------------------------
-- * VIEWS:                                         *
-- --------------------------------------------------

-- A easier view for inventory:
create view v_inventory
as
select
    i.id as id,
    i.product as product,
    p.name as `name`,
    concat(i.section, '-', i.position, '-', i.level) as position,
    i.amount as amount
from inventory as i
    join products as p
        on i.product = p.id
;


-- A easier view for inventory:
create view v_log_products
as
select
    *
from log_products
;

-- describe v_inventory;


-- Products view:
create view v_products
as
select
    p.id,
    p.name,
    p.info,
    p.price,
    group_concat( distinct pt.type separator ", " ) as 'types',
    group_concat( distinct concat(i.section, "-", i.position, "-", i.level) separator ", ") as `stored`
from (
    products as p 
        left outer join 
    product_types as pt 
        on p.id = pt.product
) join inventory as i
    on p.id = i.product
group by id
;

-- describe v_products;


-- Product categories:
create view v_product_categories
as
select distinct
    type,
    (select count(product)) as products
from product_types
group by
    type
order by type asc
;

-- describe v_product_categories;



-- --------------------------------------------------
-- * STORED PROCEDUREs:                             *
-- --------------------------------------------------

-- Get all from any table:
delimiter $$
create procedure get_all_from_table(
    t_table varchar(30)
)
begin
    select * from t_table;
end
$$
delimiter ;

-- show create procedure get_all_from_table;


-- Show all products:
-- delimiter $$
-- create procedure show_all_products()
-- begin
--     select * from products;
-- end
-- $$
-- delimiter ;

-- show create procedure show_all_products;


-- Show product view:
-- Including id, name, category, information & stored position.
delimiter $$
create procedure show_all_products()
begin
    select * from v_products;
end
$$
delimiter ;


-- Show a product:
delimiter $$
create procedure show_product(
    p_id int
)
begin
    select * from products where id = p_id;
end
$$
delimiter ;

-- show create procedure show_product;


-- Show product categories:
delimiter $$
create procedure show_product_categories()
begin
    select * from v_product_categories;
end
$$
delimiter ;

-- show create procedure show_product_categories;


-- Create a product:
delimiter $$
create procedure create_product(
    p_id int,
    p_name varchar(30),
    p_info varchar(500),
    p_price decimal(7, 2)
)
begin
    insert into products values (p_id, p_name, p_info, p_price);
end
$$
delimiter ;

-- show create procedure create_product;


-- Update a product:
delimiter $$
create procedure update_product(
    p_id int,
    p_name varchar(30),
    p_info varchar(500),
    p_price decimal(7, 2)
)
begin
    update products set
        `id` = p_id,
        `name` = p_name,
        `info` = p_info,
        `price` = p_price
    where
        `id` = p_id;
end
$$
delimiter ;

-- show create procedure update_product;


-- Delete a product:
delimiter $$
create procedure delete_product(
    p_id int
)
begin
    delete from products
    where
        `id` = p_id;
end
$$
delimiter ;

-- show create procedure delete_product;


-- Show inventory:
delimiter $$
create procedure show_inventory()
begin
    select * from v_inventory;
end
$$
delimiter ;

-- show create procedure show_inventory;


-- Show product log history:
delimiter $$
create procedure show_full_product_log()
begin
select * from v_log_products
    order by 'time' desc;
end
$$
delimiter ;

-- show create show_rows_from_product_log;


-- Show product log history:
delimiter $$
create procedure show_rows_from_product_log(
    l_limit int
)
begin
select * from v_log_products
    order by 'time' desc
    limit l_limit;
end
$$
delimiter ;

-- show create show_rows_from_product_log;


-- Show all shelves in the wearhouse:
delimiter $$
create procedure show_all_shelves()
begin
select
    *
from v_inventory
    order by position asc;
end
$$
delimiter ;

-- show create procedure show_all_shelves;


-- Insert product into inventory shelf:
delimiter $$
create procedure position_product_on_shelf(
    i_section char(2),
    i_position char(2),
    i_level char(2),
    p_id int,
    p_amount int
)
begin
start transaction;
update inventory 
    set
        `product` = p_id,
        `amount` = `amount` + p_amount
    where
        `section` = i_section and
        `position` = i_position and
        `level` = i_level
    ;
commit;
end
$$
delimiter ;



delimiter $$
create procedure search_inventory(
    i_search varchar(20)
)
begin
    select * from v_inventory
        where 
            product = i_search or
            name = i_search or
            position = i_search;

end
$$
delimiter ;



-- Delete amount of product from inventory shelf:
-- delimiter $$
-- create procedure remove_product_from_shelf(
--     i_section char(2),
--     i_position char(2),
--     i_level char(2),
--     p_id int,
--     p_amount int
-- )
-- begin
-- start transaction;
-- select * from inventory
--     where
--         `section` = i_section and
--         `position` = i_position and
--         `level` = i_level;
--     declare newAmount
--     check `amount` < p_amount
--     then
--         rollback;
--     else
--         call position_product_on_shelf(
--             i_section,
--             i_position,
--             i_level,
--             p_id,
--             (`amount` - p_amount)
--         );
--         commit;
--     end if;
-- end
-- $$
-- delimiter ;



-- --------------------------------------------------
-- * TRIGGERs:                                      *
-- --------------------------------------------------

-- New product:
create trigger log_product_insert
after insert
on products
    for each row
        insert into log_products (`product`, `date`, `time`, `activity`, `before`, `after`)
            values (new.id, curdate(), current_timestamp(), "TRIGGER - New product was registered.", "Empty", concat("New product -> ID: ", new.id, " NAME: ", new.name));



-- Delete product:
delimiter $$
create trigger log_product_delete
after delete
on products
    for each row
begin
    insert into log_products (`product`, `date`, `time`, `activity`, `before`, `after`)
        values (old.id, curdate(), current_timestamp(), "TRIGGER - Deleted product was registered.", concat("Product -> ID: ", old.id, " NAME: ", old.name, " INFO: ", old.info, " PRICE: ", old.price), "Deleted");
end
$$
delimiter ;



-- Update product:
delimiter $$
create trigger log_product_update
after update
on products
    for each row
begin
insert into log_products (`product`, `date`, `time`, `activity`, `before`, `after`)
    values (old.id, curdate(), current_timestamp(), "TRIGGER - Product was updated.", concat("Old data -> NAME: ", old.name, " INFO: ", old.info, " PRICE: ", old.price), concat("New data -> NAME: ", new.name, " INFO: ", new.info, " PRICE: ", new.price));
end
$$
delimiter ;
