#Working on Rocky02

#Database backup types:
#Logical backup: A logical backup is a backup of the database structure and data in a format that can be easily read and understood. 
#It typically includes SQL statements to recreate the database schema and insert the data. Logical backups are often used for migration or replication purposes.
#Physical backup: A physical backup is a backup of the actual database files, including data files, log files, and configuration files. 
#It captures the entire database in its current state and is typically used for disaster recovery or system migration.

#Perform a logical backup of all databases and save it to a file
mysqldump -u root -p --all-databases > /home/tom/dbbackup-all.sql

#List the contents of the current directory to verify the backup file
ls

#Display the contents of the backup file for verification
cat /home/tom/dbbackup-all.sql

#Perform a logical backup of the 'linuxdevs' database and save it to a file
mysqldump -u root -p --databases linuxdevs > /home/tom/dbbackup-linuxdevs.sql

#List the contents of the current directory to verify the backup file
ls

#Perform a logical backup of the 'linuxdevs' database and the 'developers' table and save it to a file
mysqldump -u root -p linuxdevs developers > /home/tom/dbbackup-linuxdevs-developers.sql

#List the contents of the current directory to verify the backup file
ls