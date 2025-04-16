#Working on Rocky03

#Prerequisites:
#Apache installed
#Configured firewall
#Lines in /etc/httpd/conf.d/welcome.conf commented out
#Apache service restarted

#Monitor the Apache error log in real-time
sudo tail -f /etc/httpd/logs/error_log

#Create a directory for private content
sudo mkdir /var/www/html/private

#Create a new Apache configuration file for the private directory
sudo vim /etc/httpd/conf.d/private.conf
#Add the following content:
#<Directory "/var/www/html/private">
#    AllowOverride AuthConfig
#</Directory>

#Test the Apache configuration for syntax errors
sudo apachectl configtest

#Create an .htaccess file to configure basic authentication for the private directory
sudo vim /var/www/html/private/.htaccess
#Add the following content:
#AuthType Basic
#AuthName "Restricted Content"
#AuthUserFile "/etc/httpd/conf/.userdb"
#Require user tom

#Create a test page in the private directory
sudo vim /var/www/html/private/index.html
#Add the following content:
#Private Web Server Test Page!

#Set ownership of the private directory to the Apache user
sudo chown -R apache:apache /var/www/html/private

#Set permissions for the private directory
sudo chmod -R 770 /var/www/html/private

#Navigate to the Apache configuration directory
cd /etc/httpd/conf

#Create a new user and password for basic authentication
sudo htpasswd -c .userdb tom

#Set ownership of the user database file to the Apache user
sudo chown apache:apache .userdb

#Set permissions for the user database file
sudo chmod 660 .userdb

#Reload the Apache configuration gracefully
sudo apachectl graceful

#Open the private directory in a private browser window to test authentication
firefox --private-window rocky03.example.com/private

#View the log in other terminal