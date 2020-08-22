drop table if exists account;

create table account
(
    `id` char(4) primary key,
    `name` varchar(8),
    `balance` decimal(4, 2)
);

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
delimiter //

-- Create procedure.
create procedure moveTheMoney(
    fromAccount char(4),
    toAccount char(4),
    amount numeric(4, 2)
)
-- Begin procedure.
begin
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
    else
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

    -- End IF-Statement.
    end if;

    select * from account;

    -- End procedure.
end
//

delimiter ;

call moveTheMoney('1111', '2222', 1.5);

-- show procedure status;
-- show create procedure moveTheMoney;
