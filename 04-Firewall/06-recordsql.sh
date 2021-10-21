. ./comm.sh

mysql -umember1 -h127.0.0.1 -pmember1 --table << EOL

show databases;
use employees;
show tables;
select * from employees limit 10;

EOL
