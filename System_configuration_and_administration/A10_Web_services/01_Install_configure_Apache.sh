#Working on Rocky03

#Install Apache HTTP server, SSL module, and OpenSSL
sudo dnf install -y httpd mod_ssl openssl

#Enable and start the Apache HTTP server
sudo systemctl enable --now httpd

#Permanently allow HTTP service through the firewall
sudo firewall-cmd --add-service=http --permanent

#Reload the firewall to apply changes
sudo firewall-cmd --reload

#Open the server's IP address in your web browser to verify the Apache installation
open http://<server-ip> in your web browser

#Edit the welcome configuration file to disable the default welcome page
sudo vim /etc/httpd/conf.d/welcome.conf
#Comment out all lines in the file

#Reload the Apache configuration gracefully
sudo apachectl graceful

#Open the server's IP address in your web browser to verify the changes
open http://<server-ip> in your web browser

#Install the Apache HTTP server manual
sudo dnf install -y httpd-manual

#List the contents of the installed Apache manual package
rpm -ql httpd-manual

#Open the official Apache HTTP server documentation
open https://httpd.apache.org/docs/2.4/

#Open the local Apache HTTP server manual in your web browser
open in your web browser file:///usr/share/httpd/manual/index.html

#Install the EPEL repository
sudo dnf install -y eperl-release

#Install the Elinks text-based web browser
sudo dnf install -y elinks

#Use Elinks to browse to google.ch
elinks google.ch