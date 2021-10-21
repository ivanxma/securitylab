. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -pmysql << EOL

drop user if exists fwadmin;
drop user if exists fwadmin@localhost;

create user fwadmin@'localhost' identified by 'fwadmin';

grant firewall_admin on *.* to root@'localhost';
grant firewall_admin on *.* to fwadmin@'localhost';
grant execute on mysql.* to fwadmin@'localhost';

EOL
