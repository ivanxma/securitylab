. ./comm.sh
mysql -uroot -h127.0.0.1 -P3306 -pmysql --table << EOL
SET PERSIST mysql_firewall_mode = ON;
SHOW GLOBAL VARIABLES LIKE 'mysql_firewall_mode';

select routine_name, specific_name from information_schema.routines 
where specific_name like '%firewall%';

show tables from mysql like 'firewall%';

select * from mysql.firewall_groups;
select * from mysql.firewall_membership;
select * from mysql.firewall_group_allowlist;
EOL
