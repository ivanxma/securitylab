. ./comm.sh

mysql -uaudituser2 -h127.0.0.1 << EOL


drop database if exists auditdb1;

create database auditdb1;

use auditdb1;
create table audittable1 (val int not null primary key);
insert into audittable1 values (1);

EOL

grep "<USER>" /home/mysql/data/lab02/audit.log
