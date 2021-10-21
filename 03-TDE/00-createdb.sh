
. ./comm.sh
rm -rf /home/mysql/data/lab03
mysqld --defaults-file=config/my.cnf --initialize-insecure --datadir=/home/mysql/data/lab03 --user=mysql 
