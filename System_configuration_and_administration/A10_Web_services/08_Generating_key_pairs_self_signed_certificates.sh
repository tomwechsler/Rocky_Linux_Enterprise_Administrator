#Working on Rocky03

#Navigate to the directory for TLS certificates
cd /etc/pki/tls/certs/

#Generate a private RSA key with 2048 bits for secure.example.com
sudo openssl genpkey -algorithm rsa -pkeyopt rsa_keygen_bits:2048 -out secure.example.com.key

#List the contents of the current directory to verify the key file
ls

#Generate a Certificate Signing Request (CSR) using the private key
sudo openssl req -new -key secure.example.com.key -out secure.example.com.csr
#Common Name: secure.example.com

#List the contents of the current directory to verify the CSR file
ls

#Generate a self-signed certificate valid for 365 days using the private key and CSR
sudo openssl x509 -req -days 365 -signkey secure.example.com.key -in secure.example.com.csr -out secure.example.com.crt

#List the contents of the current directory to verify the certificate file
ls

#Move the private key to the private directory for security
sudo mv secure.example.com.key ../private/

#Set permissions on the private key to restrict access
sudo chmod 600 ../private/secure.example.com.key

#Permanently allow HTTPS service through the firewall
sudo firewall-cmd --add-service=https --permanent

#Reload the firewall to apply changes
sudo firewall-cmd --reload

#Restart the Apache HTTP server to apply the SSL configuration
sudo systemctl restart httpd

#Return to the home directory
cd

#Test the SSL connection to the localhost on port 443
sudo openssl s_client -connect localhost:443 -state