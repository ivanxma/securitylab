. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -pmysql --table << EOL

select audit_log_filter_set_filter ('log_table_mysql_db', '
{
  "filter": {
    "class": { 
		"name": "table_access" , 
		"event": { 
			"name" : "insert", 
			"log" : { 
				"field" : { 
					"name" : "table_name.str", 
					"value" : "audittable1" 
				}
			}
		}
	}
  } 
}
');

SELECT audit_log_filter_set_user('audituser1@%', 'log_table_mysql_db') AS 'Result';

select * from mysql.audit_log_filter;
select * from mysql.audit_log_user;
EOL
