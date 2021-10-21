# MySQL Enterprise Firewall Lab
1. Make sure you have setup mysql runing at localhost:3306 with user : root/mysql
2. Make sure you have already load the test_db (employees) to the MySQL Server


## Setup MySQL Entertprise Firewall
* This is to run the script file from  /usr/local/mysql/share/linux_install_firewall.sql
  - 01-installFirewall.sh

* Check the firewall installation and running
  - 01-installFirewall.sh
  - Note : Please check the script and see how to find out the information

* Create user fwadmin as firewall administrator
  - 03-createFirewallAdmin.sh
  - The FIREWALL_ADMIN right is granted to root@'localhost' first
  - The fwadmin@'localhost' is created

* Create Firewall Group 'fwgrp' and set recording mode 
  - 04-createfwgroup.sh
  - Adding user member1, member2, member3
  - Grant rights to member1, member2, member3 and enlist the member1/2/3 to fwgrp

* To show the Group and User
  - 05-showGrouopAndUser.sh

* Login member1 and record a pattern of SQLs
  - 06-recordsql.sh

* Set the protecting mode for fwgrp
  - 07-protectmode.sh

* Login member1/member2 to try out SQLs which may incurs protection from firewall
  - 08-invalidSQL.sh

* Reset (clear) the rules for fwgrp
  - 10-reset.sh



