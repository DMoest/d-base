show variables like "%version%";

create database if not exists exam;

use exam;

show databases like "%exam%";

drop user if exists 'user'@'%';

create user if not exists 'user'@'%'
identified
    with mysql_native_password
    by 'pass'
;

grant all privileges
    on *.*
    to 'user'@'%'
;

select
    User,
    Host,
    Grant_priv,
    plugin
from mysql.user
where
    user in ('root', 'user')
order by 'user'
;

show grants for current_user;
