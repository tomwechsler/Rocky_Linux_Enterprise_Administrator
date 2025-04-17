#Working on Rocky03

#Cretae a new directory for the secure virtual host
sudo mkdir /var/www/html/secure

#Edit the ssl.conf file to configure the secure virtual host
sudo vim /etc/httpd/conf.d/ssl.conf
#Search for VirtualHost
#DocumentRoot "/var/www/html/secure"
#ServerName secure.example.com:443
#SSLCertificateFile /etc/pki/tls/certs/secure.example.com.crt
#SSLCertificateKeyFile /etc/pki/tls/private/secure.example.com.key

#Display the configured virtual hosts
sudo httpd -D DUMP_VHOSTS

#Create a new index.html file for the secure virtual host
sudo vim /var/www/html/secure/index.html
#secure.example.com virtual host index page

#Configure the firewall to allow HTTPS traffic
sudo firewall-cmd --add-service=https --permanent

#Reload the firewall to apply changes
sudo firewall-cmd --reload

#Restart the Apache HTTP server to apply the SSL configuration
sudo systemctl restart httpd

#Edit the /etc/hosts file to add the secure virtual host entry
sudo vim /etc/hosts
#192.168.122.38 secure.example.com

#Test connectivity to the secure virtual host
ping secure.example.com

#Install the w3m package for web testing
sudo dnf install w3m -y

#Test the secure virtual host using w3m
w3m https://secure.example.com