#Working on Rocky03

#Prerequisites:
#Apache installed
#Lines in /etc/httpd/conf.d/welcome.conf commented out
#Apache service restarted
#Name resolution for rocky03.example.com

#Display the DocumentRoot directive from the Apache configuration file
grep ^DocumentRoot /etc/httpd/conf/httpd.conf

#Display the DirectoryIndex directive from the Apache configuration file
grep DirectoryIndex /etc/httpd/conf/httpd.conf

#Edit the default index.html file to create a basic web server test page
sudo vim /var/www/html/index.html
#Add the following content:
#Basic Web Server Test Page!

#Open the web server in your browser to verify the test page
open http://rocky03.example.com in your web browser