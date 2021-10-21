
. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -pmysql --table << EOL

-- create user audituser1@'%';
 -- grant all on *.* to audituser1@'%';

-- SELECT audit_log_filter_set_filter('all_enabled', '{ "filter": { "log": true } }') AS 'Result';
SELECT audit_log_filter_set_filter('all_disabled', '{ "filter": { "log": false } }') AS 'Result';

SELECT audit_log_filter_set_filter('all_enabled', '{ "filter": { "log": true ,
    "class": [
      { "name": "connection" },
      { "name": "general" },
      { "name": "table_access" }
    ]
} }') AS 'Result';


SELECT audit_log_filter_set_user('audituser1@%', 'all_enabled') AS 'Result';
SELECT audit_log_filter_set_user('audituser2@%', 'all_disabled') AS 'Result';

select * from mysql.audit_log_filter;
select * from mysql.audit_log_user;
EOL



