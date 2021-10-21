. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -pmysql --table << EOL

use mysql;
delete from audit_log_filter;
delete from audit_log_user;
select audit_log_filter_flush() as 'Result';

EOL

