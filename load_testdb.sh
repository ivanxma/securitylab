. ./comm.sh
cd test_db
mysql -uroot -h127.0.0.1 -P3306 -pmysql < employees.sql
