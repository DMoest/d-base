-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: transactions.sql
-- Module content: Transactions from kmom04.
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.



-- TEST TABLE:

-- Example of transactions:
drop tables if exists account;
create table account
(
    `ìd` char(4) primary key,
    `name`varchar(8),
    `balance`decimal(4,2)
);

-- delete from account;

insert into account
values
    ("1111", "Adam", 10.0),
    ("2222", "Eva", 7.0)
;

select * from account;



-- Move some money - A two step process
-- step 1:
update account 
set
    balance = balance + 1.5
where
    id = "2222";

-- Before the next step is incomplete the database is in a inconsistent state

-- Step 2:
update account
set
    balance = balance - 1.5
where
    id = "1111";

select * from account;


-- Make the database ATOMICITY work:

-- Starts the transaction:
start transaction;
-- To do this in SQLite "begin transaction;"


update account
set
    balance = balance + 1.5
where
    id = "2222";

update account
set
    balance = balance - 1.5
where
    id = "1111";

-- Commit to the transaction:
commit;

-- Undo the sequence:
-- rollback;

-- To do commit/rollback in SQLite use the same commands.

select * from account;
