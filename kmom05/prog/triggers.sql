drop table if exists account_log;
drop table if exists account;

create table account
(
    `id` char(4) primary key,
    `name` varchar(8),
    `balance` decimal(4, 2)
);

create table account_log
(
    `id` int primary key auto_increment,
    `time` timestamp default current_timestamp,
    `what` varchar(20),
    `account` char(4),
    `balance` decimal(4, 2),
    `amount` decimal(4, 2)
);

describe account_log;

select * from account_log;

insert into account
values
    ('1111', 'Adam', 10.0),
    ('2222', 'Eva', 7.0)
;

select * from account;



-- Transaktionen - Adam till Eva 1.5 pengar.
start transaction;

update account
set
    balance = balance + 1.5
where
    id = '2222';

update account
set
    balance = balance - 1.5
where id = '1111';

commit;

select * from account;



-- Drop procedure if exists.
drop procedure if exists moveTheMoney;

-- Delimiter - needs a "marker" for start/stop, in this case ";;"
delimiter ;;

-- Create procedure.
create procedure moveTheMoney(
    fromAccount char(4),
    toAccount char(4),
    amount numeric(4, 2)
)
-- Begin procedure.
main:begin
    -- Declare "current balance" - Compound statement.
    declare current_balance numeric(4, 2);

    -- Select parameters of procedure.
    select fromAccount, toAccount, amount;    

    -- Start transaction.
    start transaction;

    -- Set current balance for reference to whats on the account.
    set current_balance = (select balance from account where id = fromAccount);
    
    -- Select current balance.
    select current_balance;

    -- IF-Statement to check - Compound statement.
    if current_balance - amount < 0 then
        rollback;
        select 'Insuficient funds on the account, cant proceed with transaction.' as message;
        leave main;
    -- End IF-Statement.
    end if;

        -- Update account balance - step1 (+).
        update account
        set
            balance = balance + 1.5
        where
            id = '2222';

        -- Update account balance - step2 (-).
        update account
        set
            balance = balance - 1.5
        where id = '1111';

        -- Commit to change.
        commit;

    select * from account;

-- End procedure.
end
;;

delimiter ;

-- show procedure status;
-- show create procedure moveTheMoney;



-- TRIGGERs:

-- Drop trigger if exists.
drop trigger if exists trigger_failTest;
drop trigger if exists log_accountBalanceUpdate;

-- Create trigger.
create trigger log_accountBalanceUpdate
after update -- Choose BEFORE or AFTER the triggered event.
on account for each row -- Choose ON <tableName>
    -- Log even with INSERT to logTable.
    insert into account_log (`what`, `account`, `balance`, `amount`)
        -- Automated values for data insert.
        values ('trigger', new.id, new.balance, new.balance - old.balance);


delimiter ;;

-- Trigger FAILs.
create trigger trigger_failTest
before update
on account for each row
begin
    signal sqlstate '45000' set message_text = 'My USER DEFINED ERROR message!';
end
;;

delimiter ;


call moveTheMoney('1111', '2222', 1.5);


select * from account;
select * from account_log;

-- show triggers;
-- show triggers like 'account' \G;
-- show triggers from dbwebb \G;


