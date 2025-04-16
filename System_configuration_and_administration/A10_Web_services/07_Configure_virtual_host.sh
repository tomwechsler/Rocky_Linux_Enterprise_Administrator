#Working on Rocky03

#Copy the virtual host configuration file to the Apache configuration directory
sudo cp vhost1.conf /etc/httpd/conf.d/

#View the contents of the virtual host configuration file
less /etc/httpd/conf.d/vhost1.conf

#Create the document root directory for the virtual host
sudo mkdir /var/www/html/vhost1.example.com

#Create an index.html file for the virtual host
sudo vim /var/www/html/vhost1.example.com/index.html
#vhost1.example.com virtual host index page

#Set ownership of the virtual host directory to the Apache user
sudo chown -R apache:apache /var/www/html/vhost1.example.com/

#Set permissions for the virtual host directory
sudo chmod -R 770 /var/www/html/vhost1.example.com/

#Test the Apache configuration for syntax errors
sudo apachectl configtest

#Display the configured virtual hosts
sudo httpd -D DUMP_VHOSTS

#Edit the /etc/hosts file to add the virtual host entries
sudo vim /etc/hosts
#192.168.122.139 vhost1.example.com vhost1
#192.168.122.139 www.vhost1.example.com

#Test connectivity to the virtual host vhost1.example.com
ping vhost1.example.com

#Test connectivity to the virtual host www.vhost1.example.com
ping www.vhost1.example.com

#Restart the Apache HTTP server to apply virtual host configuration changes
sudo systemctl restart httpd

#Monitor the error log for the virtual host vhost1.example.com in real-time
sudo tail -f /var/log/httpd/vhost1-error.log

#Open the virtual host vhost1.example.com in a web browser to verify the configuration
firefox vhost1.example.com