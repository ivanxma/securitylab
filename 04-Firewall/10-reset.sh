. ./comm.sh

mysql -ufwadmin -pfwadmin -h127.0.0.1 -P3306 << EOL

CALL mysql.sp_set_firewall_group_mode ('fwgrp', 'RESET');

EOL
