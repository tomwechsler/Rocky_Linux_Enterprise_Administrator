#Working on Rocky02

#List all SQL backup files in the current directory
ls -l *.sql

#Log in to the MySQL server as the root user
mysql -u root -p

#Display all databases
show databases;

#Drop the 'linuxdevs' database
drop database linuxdevs;

#Display all databases to confirm the deletion
show databases;

#Exit the MySQL shell
exit

#Restore the 'linuxdevs' database from the backup file
mysql -u root -p < /home/tom/dbbackup-linuxdevs.sql

#Log in to the MySQL server as the root user
mysql -u root -p

#Display all databases to confirm the restoration
show databases;

#Switch to the 'linuxdevs' database
use linuxdevs;

#Display all tables in the 'linuxdevs' database
show tables;

#Select all records from the 'developers' table to verify the restoration
select * from developers;