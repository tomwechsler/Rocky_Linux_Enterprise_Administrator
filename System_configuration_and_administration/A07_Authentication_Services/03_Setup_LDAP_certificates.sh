#Working on Rocky01

#Edit the OpenSSL configuration file to add the subject alternative name
sudo vim /etc/ssl/openssl.cnf

#Add the following lines at the end of the file:
[example.com]
subjectAltName = DNS:secure.example.com

#Save and exit the file

#Navigate to the directory for TLS certificates
cd /etc/pki/tls/certs

#Generate a private RSA key with 2048 bits
sudo openssl genpkey -algorithm rsa -pkeyopt rsa_keygen_bits:2048 -out server.key

#List the contents of the current directory to verify the key file
ls

#Convert the private key to a traditional RSA key format
sudo openssl rsa -in server.key -out server.key

#Generate a Certificate Signing Request (CSR) using the private key
sudo openssl req -utf8 -new -key server.key -out server.csr

#When prompted for the Common Name (CN), enter secure.example.com

#List the contents of the current directory
ls

#Generate a self-signed certificate for the LDAP server
sudo openssl x509 -req -days 3065 -signkey server.key -in server.csr -out server.crt -extfile /etc/ssl/openssl.cnf -extensions example.com

#Set permissions on the private key to restrict access
sudo chmod 600 server.key

#List the generated certificate and key files
ls -l server*

#Copy the private key to the OpenLDAP certificates directory
sudo cp server.key /etc/openldap/certs/

#Copy the certificate to the OpenLDAP certificates directory
sudo cp server.crt /etc/openldap/certs/

#Change ownership of the certificate and key files to the LDAP user
sudo chown ldap:ldap /etc/openldap/certs/server*

#Copy the server certificate to another machine (rocky02) for secure communication
scp /etc/openldap/certs/server.crt rocky02:/home/tom/server.pem

#Return to the home directory
cd

#Apply the SSL configuration to the LDAP server
sudo ldapmodify -Y EXTERNAL -H ldapi:/// -f modssl.ldif

#Restart the OpenLDAP server to apply the changes
sudo systemctl restart slapd