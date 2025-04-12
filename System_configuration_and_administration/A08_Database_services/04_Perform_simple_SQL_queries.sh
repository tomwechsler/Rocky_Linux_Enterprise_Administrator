#Working on Rocky02

#Log in to the MySQL server as the root user
mysql -u root -p 

#Switch to the 'linuxdevs' database
use linuxdevs;

#Select all records from the 'developers' table
select * from developers;

#Select all records from the 'developers' table where the age is 55
select * from developers where Age=55;

#Select all records from the 'developers' table where the age is less than 55
select * from developers where Age<55;

#Select all records from the 'developers' table where the last name is 'Tso'
select * from developers where Lastname='Tso';

#Select all records from the 'developers' table where the city is 'Helsinki' or 'Solihull'
select * from developers where City='Helsinki' or City='Solihull';

#Select all records from the 'developers' table and order them by last name in ascending order
select * from developers order by Lastname;

#Select all records from the 'developers' table and order them by last name in descending order
select * from developers order by Lastname desc;

#Select all records from the 'developers' table where the country starts with 'United'
select * from developers where Country like 'United%';

#Select all records from the 'developers' table where the country contains 'United' and order them by last name in descending order
select * from developers where Country like '%United%' order by Lastname desc;