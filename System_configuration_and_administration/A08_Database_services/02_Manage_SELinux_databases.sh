#Working on Rocky02

#Display SELinux security contexts for MariaDB processes
ps -AZ | grep mariadb

#List SELinux security contexts for MariaDB binaries
sudo ls -Z /usr/libexec/maria*

#List SELinux security contexts for the MySQL data directory
sudo ls -Z /var/lib/mysql

#If you want to use a custom database directory, you need to set the SELinux context for that directory
#Add a new SELinux file context for the custom database directory
sudo semanage fcontext -a -t mysqld_db_t "/database(/.*)?"

#Apply the SELinux file context changes to the custom database directory
sudo restorecon -Rv /database

#Display all SELinux booleans related to MySQL
getsebool -a | grep mysql

#List all SELinux port contexts related to MySQL
sudo semanage port -l | grep mysql

#If you wish to use a custom TCP port for MySQL, you need to add a new SELinux port context
#Add a new SELinux port context for MySQL on TCP port 9000
sudo semanage port -a -t mysqld_port_t -p tcp 9000

#Enable the SELinux boolean to allow user processes to connect to MySQL (optional)
sudo setsebool -P selinuxuser_mysql_connect_enable 1