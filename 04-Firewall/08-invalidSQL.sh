. ./comm.sh

mysql -umember1 -h127.0.0.1 -pmember1 --table -e " use employees;select * from employees limit 10;"
mysql -umember1 -h127.0.0.1 -pmember1 --table -e " select * from employees.employees limit 10;"
mysql -umember1 -h127.0.0.1 -pmember1 --table -e " select * from employees.employees;"
mysql -umember1 -h127.0.0.1 -pmember1 --table -e " select * from employees.dept_emp ;"

mysql -umember2 -h127.0.0.1 -pmember2 --table -e " use employees;select * from employees limit 10;"
mysql -umember2 -h127.0.0.1 -pmember2 --table -e " select * from employees.dept_emp ;"


