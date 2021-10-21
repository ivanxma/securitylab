# Enterprise Audit Installation and Configuation

## Create and startup MySQL Server
* 00-createdb.sh
* 01-startdb.sh

## Change the password
By default --initialize will create the MySQL Server Data with randomly generated root password.  The password is stored in the error log file.   The script 02-resetpassword is created to change the password to 'mysql'

## Install Enterprise Audit 
* With the Terminal to login to mysql session (127.0.0.1:3306), user/password as root/mysql
* SOURCE /usr/local/mysql/share/audit_log_filter_linux_install.sql
* Execute the following SQL query to verify that the audit_log plugin has been activated:
** SELECT PLUGIN_NAME, PLUGIN_STATUS FROM INFORMATION_SCHEMA.PLUGINS WHERE PLUGIN_NAME LIKE 'audit%';
* Execute the following SQL query to verify that the user-defined functions of MySQL Enterprise Audit have been installed:
** SELECT * FROM mysql.func WHERE name LIKE 'audit%';

* In a Linux terminal window, execute the following command to list the audit log files:
** ls -l /home/mysql/data/lab02/audit*

