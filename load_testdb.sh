. ./comm.sh
git clone https://github.com/datacharmer/test_db
cd test_db
mysql -uroot -h127.0.0.1 -P3306 -pmysql < employees.sql
