. ./comm.sh

mysql -uaudituser1 -h127.0.0.1 --table << EOL


drop database if exists auditdb1;

create database auditdb1;

use auditdb1;
create table audittable1 (val int not null primary key);
insert into audittable1 values (1);

select * from audittable1;
use mysql;

select * from mysql.user;

EOL

