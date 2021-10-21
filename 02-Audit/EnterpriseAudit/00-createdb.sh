. ./comm.sh

rm -rf /home/mysql/data/lab02
mkdir -p /home/mysql/data/lab02


echo "Initialize MySQL DB  ...."
mysqld --defaults-file=config/my1-secure.cnf --initialize --datadir=/home/mysql/data/lab02 --user=mysql 

