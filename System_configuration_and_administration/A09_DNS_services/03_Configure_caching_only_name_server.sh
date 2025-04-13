#Working on Rocky01

#Edit the named.conf file
sudo vim /etc/named.conf

#Edit the following lines in the file:
# 1. Change the listen-on port to { any; };
# 2. Change the listen-on-v6 port to { any; };
# 3. Change the allow-query to { any; };
# 4. Change dnssec-validation to no;

#Check the BIND configuration file for syntax errors
sudo named-checkconf

#Restart the BIND service to apply changes
sudo systemctl restart named

#Check the status of the BIND service
sudo systemctl status named

#Permanently allow the DNS service through the firewall
sudo firewall-cmd --add-service=dns --permanent

#Reload the firewall to apply changes
sudo firewall-cmd --reload

#Switch to Rocky02

#Connectivity test
ping 192.168.122.48

#Check the namersolution
dig @192.168.122.48 google.ch