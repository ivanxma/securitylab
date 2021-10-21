# 01-setup

## 00-stopmysqld-service.sh
	To stop any system service for mysqld
	including mysqld, mysqld@mysql01/mysql02/mysql03

## 01-initDB.sh
	To initialize Data on datadir=/home/mysql/data/lab01 using command line

## 02-initDB-with-config.sh
	To initialize Data on datadir=/home/mysql/data/lab01 using config file

## 03-startDB.sh
	To startup MySQL server using basedir=/usr/local/mysql with config file

## 04-ChangePassword.sh
	Change password where the default locked password is stored in error log,

## 06-startDB-mysql-safe.sh
	To stop the Server and restart it with mysqld_safe  (Note: with Tar installation, you can find mysqld_safe, whereas using rpm, the mysqld_safe is not included.

## 07-restart-mysql.sh
	To restart MySQL server using mysql command - "restart".   

## 08-showVariables.sh
	To demo certain "show variables" function examples.

## 09-process.sh
	To demo showing status of the connection, and show processlist

## 10-createUser.sh
	To create a demo users (user0, user1, user2, user3) with different attributes
	user0 :  using default authentication plugin and without attaching host string
	user1@'localhost' : using default authentication plugin and having 'localhost' as host string
	user2@'%' : using 'mysql_native_password' as authentication plugin
	user2@'localhost' : using 'mysql_native_password' as authentication plugin and having max_queries_perhour as 5, max_updates per hour 5 and max_connection_per_hour as 5 and max_user_connection as 3
	user3@'localhost' : using default authentication plugin and being locked and password expired.

## 11-testUser2.sh
	To demo the restriction given to the user2@'localhost' login

## 12-testGeneralLog.sh
	To test 'general_log' and showing the log entries

## 13-createTable.sh
	To create mytable1 using innodb, mytable2 using csv and mytable using memory

## 14-showInnoDBEngine.sh
	To show 'innodb engine status'

## 15-showPlugins.sh
	To show plugins installed

## 21-initmy123.sh
	To initialize my1, my2, my3 datadir
	
## 22-systemd-setup.sh
	To setup systemd service for my1 service

