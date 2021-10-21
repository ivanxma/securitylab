. ./comm.sh

if [ $USER != "mysql" ]
then
	echo "Please use mysql as OS user to run the lab"
else

if [ -d /home/mysql/data/lab01 ]
then
	rm -rf /home/mysql/data/lab01
fi
mkdir -p /home/mysql/data/lab01
mysqld --initialize --datadir=/home/mysql/data/lab01 > error.log 2>&1
cat error.log

fi
