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
  - early-plugin-load=keyring_encrypted_file.so
  - keyring_encrypted_file_data=/home/mysql/data/lab02/mysql-keyring/keyring-encrypted
  - keyring_encrypted_file_password=password

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

  - Note: The audit log is rotated and the new password applies to all new audit log files only. All existing encrypted audit log files retain their original password and all existing unencrypted audit log files remain unencrypted.

* Show the audit files in the datadir where new encrypted audit log files are there
  - system ls -l /home/mysql/data/lab02/aud*

## Decrypt the audit log file (which is encrypted)
* Execute the following SELECT statement to query the keyring_keys table in the performance_schema database.
  - SELECT * FROM performance_schema.keyring_keys WHERE KEY_ID LIKE 'audit\_log-%'
  - List all the key IDs of audit log encryption password stored in the keyring.

* For each key ID found in the previous step, execute the following statement after substituting the key ID:
  - SELECT audit_log_encryption_password_get('<key_id>')

* Execute again system command to list the file content
  - system ls -l /home/mysql/data/lab02/aud*

* Identify an audit log file in the format audit.< datetime >.log.<key_id>.enc. Execute the following command to view the decrypted audit log file by substituting <password> with the password of the corresponding key ID and <full_path_of_the_audit_file> with the full path of the audit log file:
  - system sudo openssl enc -d -aes-256-cbc -pass pass:'<password>' -md sha256 -in <full_path_of_the_audit_file>
  - Note: The file with the format audit.log.<key_id>.enc is the current audit log file, it cannot be decrypted because it has not been closed. You need to rotate the audit log if you want to decrypt and view the latest audited records.
