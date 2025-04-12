#Working on Rocky02

#Install MariaDB server
sudo dnf install -y mariadb-server mariadb

#Enable and start the MariaDB service
sudo systemctl enable mariadb --now

#Check the status of the MariaDB service
sudo systemctl status mariadb

#Configure the Firewall to allow MariaDB traffic
sudo firewall-cmd --add-service=mysql --permanent

#Reload the Firewall to apply the changes
sudo firewall-cmd --reload

#Run the MariaDB secure installation script
sudo mysql_secure_installation
# Hit enter we have no root password
# Yes to unix_socket authentication
# Yes change root password
# Yes to remove anonymous users
# Yes to disallow root login remotely
# No to remove test database (in a production environment you would want to remove it)
# Yes to reload privilege tables