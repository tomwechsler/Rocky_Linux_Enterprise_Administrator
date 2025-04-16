#Working on Rocky03

#Watch the Apache HTTP server error log in a separate terminal
sudo tail -f /etc/httpd/logs/error_log

#Change to the Apache configuration directory
cd /etc/httpd/conf.d

#List the contents of the directory
ls

#Copy the private.conf file to create a new configuration file for group-managed content
sudo cp private.conf privategroup.conf

#Edit the new configuration file to set up group-managed content
sudo vim privategroup.conf
#<Directory "/var/www/html/privategroup">

#Check the syntax of the Apache configuration files
sudo apachectl configtest

#Change to the web root directory
cd /var/www/html

#Create a directory for group-managed content
sudo mkdir privategroup

#Create a new .htaccess file for the group-managed content
sudo vim privategroup/.htaccess
#AuthType Basic
#AuthName "Restricted Content"
#AuthGroupFile "/etc/httpd/conf/.groupdb"
#AuthUserFile "/etc/httpd/conf/.grouppassdb"
#Require group webgroup

#Create a test page in the group-managed content directory
sudo vim privategroup/index.html
#Private Web Server Group Test Page!

#Set ownership of the group-managed content directory to the Apache user
sudo chown -R apache:apache privategroup/

#Set permissions for the group-managed content directory
sudo chmod -R 770 privategroup/

#Change to the Apache configuration directory
cd /etc/httpd/conf

#Create a new group database file for group-managed content
sudo vim .groupdb
#webgroup: tom user2

#Create a new password file for group-managed content and add the user 'tom'
sudo htpasswd -c .grouppassdb tom

#Add another user 'user2' to the password file
sudo htpasswd .grouppassdb user2

#Set ownership of the password file to the Apache user
sudo chown apache:apache .grouppassdb

#Set permissions for the password file
sudo chmod 660 .grouppassdb

#Restart the Apache HTTP server to apply changes
sudo systemctl restart httpd

#Open the group-managed content in a private browser window to test authentication (tom)
firefox --private-window rocky03.example.com/privategroup

#Open the group-managed content in a private browser window to test authentication (user2)
firefox --private-window rocky03.example.com/privategroup