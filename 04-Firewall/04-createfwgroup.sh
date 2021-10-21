. ./comm.sh

# create member users

mysql -uroot -h127.0.0.1 -P3306 -pmysql << EOL

drop user if exists member1@'localhost';
drop user if exists member2@'localhost';
drop user if exists member3@'localhost';

create user member1@'localhost' identified by 'member1';
create user member2@'localhost' identified by 'member2';
create user member3@'localhost' identified by 'member3';

EOL

mysql -ufwadmin -h127.0.0.1 -P3306 -pfwadmin << EOL
# mysql -uroot -h127.0.0.1 -P3306 -pmysql << EOL
CALL mysql.sp_set_firewall_group_mode_and_user('fwgrp', 'RECORDING', "member1@localhost");
CALL mysql.sp_firewall_group_enlist('fwgrp', "member1@localhost");
CALL mysql.sp_firewall_group_enlist('fwgrp', "member2@localhost");
CALL mysql.sp_firewall_group_enlist('fwgrp', "member3@localhost");

EOL
