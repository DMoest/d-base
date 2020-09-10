-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: ddl.sql
-- Module content: All DDLs for the database, tables, views, stored procedures & triggers.



-- --------------------------------------------------
-- * DROP FIRST IF EXISTS!                          *
-- --------------------------------------------------

-- Drop tabels if exists:
drop table if exists log_products;
drop table if exists log_orders;
drop table if exists invoices;
drop table if exists order_from_customer;
drop table if exists orders;
drop table if exists customer_phones;
drop table if exists customers;
drop table if exists products_to_picking_list;
drop table if exists picking_lists;
drop table if exists product_types;
drop table if exists product_pictures;
drop table if exists inventory;
drop table if exists products;

-- Drop views if exists:
drop view if exists v_products;
drop view if exists v_product;
drop view if exists v_product_categories;
drop view if exists v_inventory;
drop view if exists v_log_products;
drop view if exists v_customers;
drop view if exists v_orders;
drop view if exists v_picking_lists;

-- Drop procedures if exists:
drop procedure if exists get_all_from_table;
drop procedure if exists show_all_products;
drop procedure if exists show_product;
drop procedure if exists show_product_categories;
drop procedure if exists create_product;
drop procedure if exists update_product;
drop procedure if exists delete_product;
drop procedure if exists give_category_to_product;
drop procedure if exists search_products;
drop procedure if exists show_full_product_log;
drop procedure if exists show_rows_from_product_log;
drop procedure if exists show_inventory;
drop procedure if exists show_all_shelves;
drop procedure if exists search_inventory;
drop procedure if exists position_product_on_shelf;
drop procedure if exists remove_product_from_shelf;
drop procedure if exists search_orders;
drop procedure if exists show_all_customers;
drop procedure if exists show_all_orders;
drop procedure if exists show_order;
drop procedure if exists get_picking_list;
drop procedure if exists get_customer_for_order;
drop procedure if exists get_customer_from_order;
drop procedure if exists add_product_to_picking_list;
drop procedure if exists place_the_order;
drop procedure if exists ship_order;
drop procedure if exists create_order;
drop procedure if exists delete_order;

-- Drop functions if exists:
drop function if exists order_status;

-- Drop trigger if exists:
drop trigger if exists log_product_insert;
drop trigger if exists log_product_update;
drop trigger if exists log_product_delete;
drop trigger if exists log_order_create;
drop trigger if exists log_order_update;
drop trigger if exists log_order_delete;

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
    `id` int unique auto_increment not null,
    `name` varchar(30) not null,
    `info` varchar(500) not null,
    `price` decimal(10, 2) not null,

    primary key (id),
    unique key `product_id` (`id`),
    key (`name`),
    fulltext key (`name`),
    fulltext key (`info`)

)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- Product types:
create table product_types
(
    `id` int unique auto_increment not null,
    `product` int not null,
    `type` varchar(30) not null,

    primary key (id),
    unique key (id),
    fulltext key (`type`),
    foreign key (product) references products(id)
    on delete cascade
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- Product pictures:
create table product_pictures
(
    `id` int unique auto_increment not null,
    `product` int not null,
    `picture` varchar(200) not null,
    `text` varchar(100) not null,
    `alt` varchar(100) not null,

    primary key (id),
    unique key (id),
    fulltext key (`text`),
    foreign key (product) references products(id)
    on delete cascade
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

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
    unique key (id),
    foreign key (product) references products(id)
    on delete cascade
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

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

    primary key (id),
    unique key (`id`),
    fulltext key (`firstname`),
    fulltext key (`lastname`),
    fulltext key (`street`),
    fulltext key (`email`),
    key (`birthday`)

)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- Picking_lists:
create table picking_lists
(
    `id` int unique not null auto_increment,
    `order` int not null,
    `index` int not null,
    `product` int not null,
    `amount` int not null,

    primary key (id),
    unique key (id),
    foreign key (product) references products(id)
    on delete cascade
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- Products_to_picking_list:
create table products_to_picking_list
(
    `id` int unique auto_increment not null,
    `product` int not null,
    `order` int not null,
    `amount` int not null,

    primary key (id),
    unique key (id),
    foreign key (product) references products(id)
    on delete cascade
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- Orders:
create table orders
(
    `id` int unique auto_increment not null,
    `customer` int not null,
    `picking_list` int default 0 not null,
    `created` timestamp default current_timestamp,
    `ordered` timestamp default null,
    `shipped` timestamp default null,
    `updated`timestamp default null
        on update current_timestamp,
    `deleted` timestamp default null,

    primary key (id),
    unique key (id),
    key (customer),
    key (picking_list),
    foreign key (customer) references customers(id)
    on delete set default
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- Orders from customers:
create table order_from_customer
(
    `id` int unique not null,
    `customer` int not null,

    primary key (id),
    unique key (id),
    key (customer),
    foreign key (customer) references customers(id)
    on delete cascade
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- Customer phones:
create table customer_phones
(
    `id` int not null,
    `phone` int unique not null,

    primary key (phone),
    unique key (phone),
    foreign key (id) references customers(id)
    on delete cascade
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

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
    foreign key (product_list) references picking_lists(id)
    on delete cascade
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- Activity LOG products:
create table log_products
(
    `id` int unique auto_increment not null,
    `product` int not null,
    `time` timestamp default current_timestamp not null,
    `date` date not null,
    `activity` varchar(200) not null,
    `before` varchar(250) not null,
    `after` varchar(250) not null,

    primary key (id),
    unique key (id),
    key (product),
    fulltext key `log_activity` (`activity`),
    fulltext key `log_before` (`before`),
    fulltext key `log_after` (`after`)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- Activity LOG orders:
create table log_orders
(
    `id` int unique auto_increment not null,
    `order` int not null,
    `customer` varchar(50) not null,
    `time` timestamp default current_timestamp not null,
    `activity` varchar(200) not null,
    `before` varchar(250) not null,
    `after` varchar(250) not null,

    primary key (id),
    unique key (id),
    fulltext key `log_activity` (`activity`),
    fulltext key `log_before` (`before`),
    fulltext key `log_after` (`after`)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;



-- FUNCTIONs:
-- --------------------------------------------------
-- Order status:
delimiter $$
create function order_status(
    time_created timestamp,
    time_updated timestamp,
    time_ordered timestamp,
    time_shipped timestamp,
    time_deleted timestamp
)
returns char(10)
deterministic
begin
    if time_deleted is not null then
        return 'Raderad';
    elseif time_shipped is not null then
        return 'Skickad';
    elseif time_ordered is not null then
        return 'Beställd';
    elseif time_updated is not null then
        return 'Uppdaterad';
    elseif time_created is not null then
        return 'Skapad';
    end if;
    return 'Status okänd';
end
$$
delimiter ;



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

-- Products view:
create view v_products
as
select
    p.id,
    p.name,
    p.info,
    p.price,
    group_concat( distinct pt.type separator ", " ) as 'types',
    group_concat( distinct concat(i.section, "-", i.position, "-", i.level) separator ", ") as `stored`,
    sum( distinct i.amount ) as `amount`,
    pp.picture,
    pp.alt,
    pp.text
from products as p 
    left outer join product_types as pt 
        on p.id = pt.product
    left outer join product_pictures as pp
        on p.id = pp.product
    left outer join inventory as i
        on p.id = i.product
group by
    id,
    picture,
    alt,
    text
order by id
;

-- Product (single product) view:
create view v_product
as
select
    p.id,
    p.name,
    p.info,
    p.price,
    -- group_concat( distinct pt.type separator ", " ) as 'types',
    sum( distinct i.amount ) as `amount`
from products as p
    join product_types as pt
        on p.id = pt.product
    join inventory as i
        on p.id = i.product
group by id
order by id asc;

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

-- Customers view:
create view v_customers
as
select
    c.id,
    concat(c.firstname, ' ', c.lastname) as `name`,
    concat(c.street, ' ', c.number, ' ', c.post_code, ' ', c.city, ' ', c.country) as adress,
    c.email,
    group_concat( distinct cp.phone separator ", " ) as `phone`
from customers as c
    join customer_phones as cp
        on c.id = cp.id
group by
    id
order by
    id asc
;


-- Orders view:
create view v_orders
as
select
    o.id as `id`,
    o.customer as `customer`,
    (concat(c.firstname, " ", c.lastname)) as `name`,
    count(pl.order) as `rows`,
    o.created as `created`,
    order_status(o.created, o.updated, o.ordered, o.shipped, o.deleted) as `status`
from orders as o
    join customers as c
        on o.customer = c.id
    left outer join picking_lists as pl
        on o.id = pl.order
group by
    id
order by o.id asc;



-- Picking list view:
create view v_picking_lists
as
select
    pl.id,
    pl.order,
    pl.index,
    pl.product,
    p.name,
    p.info,
    pl.amount,
    group_concat( distinct concat(i.section, "-", i.position, "-", i.level) separator ", " ) as 'position',
    sum( distinct i.amount ) as `stored`
from picking_lists as pl
    join products as p
        on pl.product = p.id
    join inventory as i
        on p.id = i.product
group by
    pl.id,
    pl.product,
    i.product
order by pl.id asc;



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

-- Show product view:
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
    select * from v_products where id = p_id;
end
$$
delimiter ;


-- Show product categories:
delimiter $$
create procedure show_product_categories()
begin
    select * from v_product_categories;
end
$$
delimiter ;


-- Create a product:
delimiter $$
create procedure create_product(
    p_id int,
    p_name varchar(30),
    p_info varchar(500),
    p_price decimal(7, 2)
)
begin
    insert into
        products 
    values
        (p_id, p_name, p_info, p_price);
end
$$
delimiter ;


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

-- Search products:
delimiter $$
create procedure search_products(
    i_search varchar(500)
)
begin
    select * 
    from v_products
        where 
            id like i_search or
            name like i_search or
            info like i_search or
            types like i_search
        order by id asc;
end
$$
delimiter ;


delimiter $$
create procedure give_category_to_product(
    product_id int,
    type varchar(30)
)
begin
    insert into product_types
        (`product`, `type`)
    values (product_id, type);
end
$$
delimiter ;


-- Show inventory:
delimiter $$
create procedure show_inventory()
begin
    select * from v_inventory;
end
$$
delimiter ;


-- Search inventory:
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


-- Delete amount of product from inventory shelf:
delimiter $$
create procedure remove_product_from_shelf(
    i_section char(2),
    i_position char(2),
    i_level char(2),
    p_id int,
    p_amount int
)
begin
    declare current_amount int;
    declare product_on_shelf int;

    start transaction;

    set current_amount = 
        (select amount from inventory 
            where 
                section = i_section and
                position = i_position and
                level = i_level
        );

    select current_amount;
    
    set product_on_shelf = 
        (select product from inventory 
            where 
                section = i_section and
                position = i_position and
                level = i_level
        );

    select product_on_shelf;

    if (current_amount - p_amount < 0) or (product_on_shelf != p_id) then
        rollback;
        select 'Product amount is not enough to make transaction' as message;
    else
        update inventory
            set amount = current_amount - p_amount
            where 
                section = i_section and
                position = i_position and
                level = i_level;
        commit;
    end if;
end

$$
delimiter ;



-- CUSTOMER PROCEDUREs:
-- --------------------------------------------------
-- Show all customers:
delimiter $$
create procedure show_all_customers()
begin
select * from v_customers order by id asc;
end
$$
delimiter ;



-- ORDER PROCEDUREs:
-- --------------------------------------------------
-- Show all orders:
delimiter $$
create procedure show_all_orders()
begin
    select * from v_orders;
end
$$
delimiter ;


-- Show a order:
delimiter $$
create procedure show_order(
    order_id int
)
begin
select * from v_orders
where
    id like order_id;
end
$$
delimiter ;


-- Create order:
delimiter $$
create procedure create_order(
    customer_id int
)
begin
insert into orders
        (customer)
    values
        (customer_id);
end
$$
delimiter ;


-- Get picking list for order:
delimiter $$
create procedure get_picking_list(
    input_order int
)
begin
select *
    from v_picking_lists
        where `order` = `input_order`;
end
$$
delimiter ;


-- Add product to picking list:
delimiter $$
create procedure add_product_to_picking_list(
    order_id int,
    product_id int,
    amount int
)
begin
insert into products_to_picking_list
    (`order`, `product`, `amount`)
values (order_id, product_id, amount);
end
$$
delimiter ;


-- Search orders:
delimiter $$
create procedure search_orders(
    search_for varchar(150)
)
begin
select *
from v_orders
    where 
        `id` like search_for or
        `customer` like search_for or
        `picking_list` like search_for or
        `date` like search_for or
        `status` like search_for;
end
$$
delimiter ;


-- Get the customer for order:
delimiter $$
create procedure get_customer_from_order(
    order_id int
)
begin
    declare customer_id int;

    set customer_id = (
    select
        customer
    from v_orders
        where
            id = order_id
    );

    select * from customers
        where id = customer_id;
end
$$
delimiter ;


delimiter $$
create procedure place_the_order(
    input_order int
)
begin
start transaction;

insert into picking_lists
    (`order`, `index`, `product`, `amount`)
select
    `order`,
    `id`,
    `product`,
    `amount`
from products_to_picking_list as ptpl
    where ptpl.order = input_order;

update orders
    set `ordered` = current_timestamp
    where id = input_order;

delete from products_to_picking_list
    where `order` like input_order;

commit;
end
$$
delimiter ;


delimiter $$
create procedure ship_order(
    order_id int
)
begin
update orders
    set `shipped` = current_timestamp
    where id = order_id;
end
$$
delimiter ;


-- Delete order:
delimiter $$
create procedure delete_order(
    order_id int
)
begin
update orders
    set `deleted` = current_timestamp
    where id = order_id;
end
$$
delimiter ;


-- LOG PROCEDUREs:
-- --------------------------------------------------
-- Show product log history:
delimiter $$
create procedure show_full_product_log()
begin
select * from v_log_products
    order by 'time' desc;
end
$$
delimiter ;


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



-- --------------------------------------------------
-- * TRIGGERs:                                      *
-- --------------------------------------------------

-- PRODUCT TRIGGERs
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



-- ORDER TRIGGERs
-- --------------------------------------------------
create trigger log_order_create
after insert
on orders
    for each row
        insert into log_orders (`order`, `customer`, `time`, `activity`, `before`, `after`)
            values (new.id, new.customer, current_timestamp(), "TRIGGER - New order was registered.", "Empty", concat("New order -> ID: ", new.id, " CUSTOMER: ", new.customer));

-- Delete order:
delimiter $$
create trigger log_order_delete
after delete
on orders
    for each row
begin
    insert into log_orders (`order`, `customer`, `time`, `activity`, `before`, `after`)
        values (old.id, old.customer, current_timestamp(), "TRIGGER - Deleted order was registered.", concat("order -> ID: ", old.id, " CUSTOMER: ", old.customer, " OLD PICKING LIST: ", old.picking_list), "Deleted");
end
$$
delimiter ;

-- Update order:
delimiter $$
create trigger log_order_update
after update
on orders
    for each row
begin
insert into log_orders (`order`, `customer`, `time`, `activity`, `before`, `after`)
    values (old.id, old.customer, current_timestamp(), "TRIGGER - order was updated.", concat("Old data -> CUSTOMER: ", old.customer, " OLD PICKING LIST: ", old.picking_list), concat("New data -> CUSTOMER: ", new.customer, " NEW PICKING LIST: ", new.picking_list));
end
$$
delimiter ;
