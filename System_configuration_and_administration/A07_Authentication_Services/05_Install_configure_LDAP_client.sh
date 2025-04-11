#Working on Rocky02

#Install OpenLDAP clients, SSSD, and Oddjob for managing home directories
sudo dnf install -y openldap-clients sssd sssd-ldap oddjob-mkhomedir

#Configure the system to use SSSD with automatic home directory creation
sudo authselect select sssd with-mkhomedir --force

#Enable and start the Oddjobd service
sudo systemctl enable oddjobd --now

#View the SSSD configuration file
less sssd.conf

#Copy the SSSD configuration file to the appropriate directory
sudo cp sssd.conf /etc/sssd/

#Set the correct permissions for the SSSD configuration file
sudo chmod 600 /etc/sssd/sssd.conf

#Edit the LDAP client configuration file
sudo vim /etc/openldap/ldap.conf

#Replace the following lines:
BASE dc=example,dc=com
URI ldap://secure.example.com
TLS_CACERT /etc/openldap/certs/server.pem

#Save and exit the file

#Edit the hosts file
sudo vim /etc/hosts
192.168.122.xxx secure.example.com

#Safe and exit the file

#Copy the server certificate to the OpenLDAP certificates directory
sudo cp /home/tom/server.pem /etc/openldap/certs/

#Restart the SSSD and Oddjobd services
sudo systemctl restart sssd oddjobd

#Verify the LDAP user 'rhuser' in the local system
sudo getent passwd rhuser

#Search for the LDAP user 'rhuser' using LDAPS
sudo ldapsearch -x ldaps://secure.example.com cn=rhuser -b "dc=example,dc=com"

#Perform a debug-level LDAP search for the user 'rhuser' using LDAPS
sudo ldapsearch -d1 -x ldaps://secure.example.com cn=rhuser -b "dc=example,dc=com"

#Switch to the LDAP user 'rhuser'
sudo -i rhuser