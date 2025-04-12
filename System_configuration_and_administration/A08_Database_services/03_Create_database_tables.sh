#Working on Rocky02

#Log in to the MySQL server as the root user
mysql -u root -p 

#Display all existing databases
show databases;

#Create a new database named 'linuxdevs'
create database linuxdevs;

#Verify that the 'linuxdevs' database was created
show databases;

#Switch to the 'linuxdevs' database
use linuxdevs;

#Create a table named 'developers' with specified columns
create table developers(devnum int, Name varchar(20), Lastname varchar(20), City varchar(20), Country varchar(20), Age int);

#Display the structure of the 'developers' table
desc developers;

#Insert a record for Linus Torvalds into the 'developers' table
insert into developers values('1','Linus','Torvalds','Helsinki','Finland',54);

#Insert a record for Alan Cox into the 'developers' table
insert into developers values('2','Alan','Cox','Solihull','United Kingdom',55);

#Insert a record for Theodore Tso into the 'developers' table
insert into developers values('3','Theodore','Tso','Palo Alto','United States',55);

#Display all records from the 'developers' table
select * from developers;