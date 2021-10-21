. ./comm.sh

mysql -ufwadmin -h127.0.0.1 -pfwadmin << EOL

CALL mysql.sp_set_firewall_group_mode ('fwgrp', 'PROTECTING');

EOL
