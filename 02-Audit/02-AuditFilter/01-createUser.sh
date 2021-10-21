. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -pmysql << EOL

drop user if exists 'audituser1';
drop user if exists 'audituser2';
drop user if exists 'appuser1';
drop user if exists 'appuser2';
create user 'audituser1';
create user 'audituser2';
create user 'appuser1';
create user 'appuser2';
grant all on *.* to 'audituser1';
grant all on *.* to 'audituser2';
grant all on *.* to 'appuser1';
grant all on *.* to 'appuser2';

select user, host from mysql.user where user like 'audituser%';
EOL
