#Working on Rocky01

#Be sure that the hostnames are resolvable => if needed configure /etc/hosts
#192.168.122.48 rocky01.example.com rocky01
#192.168.122.149 rocky02.example.com rocky02

#Display the list of enabled repositories
sudo dnf repolist

#Install the EPEL repository
sudo dnf install -y epel-release

#Enable the CRB (CodeReady Builder) repository
sudo /usr/bin/crb enable

#Install OpenLDAP server and client packages
sudo dnf install -y openldap-servers openldap-clients

#Enable SELinux boolean for LDAP authentication
sudo setsebool -P authlogin_nsswitch_use_ldap on

#Enable and start the OpenLDAP server (slapd)
sudo systemctl enable slapd --now

#Set the default firewall zone to 'public'
sudo firewall-cmd --set-default-zone=public

#Permanently allow the LDAP service through the firewall
sudo firewall-cmd --add-service=ldap --permanent

#Permanently allow the LDAPS service through the firewall
sudo firewall-cmd --add-service=ldaps --permanent

#Reload the firewall to apply changes
sudo firewall-cmd --reload