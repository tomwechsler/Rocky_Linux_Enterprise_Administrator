#Working on Rocky02

#Display all running processes
ps -ef

#Filter running processes for MySQL
ps -ef | grep mysql

#Shut down the MySQL server
sudo mysqladmin shutdown

#Display all running processes to confirm MySQL has stopped
ps -ef

#Filter running processes for MySQL to confirm it is no longer running
ps -ef | grep mysql

#Start MySQL in safe mode with grant tables disabled
sudo mysqld_safe --skip-grant-tables --user=mysql &

#Log in to the MySQL server as the root user without a password
mysql -u root -p

#Flush the privileges to reload the grant tables
FLUSH PRIVILEGES;

#Reset the root password
ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';

#Exit the MySQL shell
exit

#Shut down the MySQL server
mysqladmin -u root -p shutdown

#Stop the MariaDB service
sudo systemctl stop mariadb

#Start the MariaDB service
sudo systemctl start mariadb

#Log in to the MySQL server as the root user with the new password
mysql -u root -p