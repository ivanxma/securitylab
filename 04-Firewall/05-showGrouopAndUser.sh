mysql -uroot -h127.0.0.1 -P3306 -pmysql --table << EOL
select * from mysql.firewall_groups;
select * from mysql.firewall_membership;
EOL
