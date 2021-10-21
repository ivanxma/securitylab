. ./comm.sh

rm -rf /home/mysql/data/lab02
mkdir -p /home/mysql/data/lab02

mysqld --defaults-file=config/my1.cnf --initialize-insecure --datadir=/home/mysql/data/lab02 --user=mysql

