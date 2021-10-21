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
  * SELECT PLUGIN_NAME, PLUGIN_STATUS FROM INFORMATION_SCHEMA.PLUGINS WHERE PLUGIN_NAME LIKE 'audit%';

* Execute the following SQL query to verify that the user-defined functions of MySQL Enterprise Audit have been installed:
  * SELECT * FROM mysql.func WHERE name LIKE 'audit%';

* In a Linux terminal window, execute the following command to list the audit log files:
  * ls -l /home/mysql/data/lab02/audit*

# Encrypting Audit Data
## Configure keyring
* Change the my1.cnf to append the following 3 lines 
  early-plugin-load=keyring_encrypted_file.so
  keyring_encrypted_file_data=/home/mysql/data/lab02/mysql-keyring/keyring-encrypted
  keyring_encrypted_file_password=password

## Configure Encryption for Audit Log
* Login to mysql session (127.0.0.1:3306) with user root/mysql

* Execute the following to enable audit log encryption
  * SET PERSIST_ONLY audit_log_encryption='AES'
  * Note: This is a static variable that requires a restart for the change to take effect.

* Restart the MySQL server by executing the RESTART command in the mysql prompt.
  * likie this mysql> restart;

* Execute the following SHOW statement to view the values of all audit log server variables and verify that the encryption of audit log files has been enabled:
  * SHOW VARIABLES LIKE 'audit%'

* Execute the following statement to invoke the user-defined function to retrieve the current password used to encrypt the audit log file:
  * SELECT audit_log_encryption_password_get()

* Execute the following statement to invoke a user-defined function to set "secret1â"as the new audit log encryption password.
  * SELECT audit_log_encryption_password_set('secret1')

