#Working on Rocky02

#Remove the Sendmail package
sudo dnf remove sendmail

#Install Postfix and the s-nail mail client
sudo dnf install -y postfix s-nail

#Edit the Postfix main configuration file
sudo vim /etc/postfix/main.cf
#Add or modify the following lines:
#inet_interfaces = all
#mynetworks = 192.168.122.0/24, 127.0.0.0/8

#Check the Postfix configuration for syntax errors
sudo postfix check

#Set Postfix as the default Mail Transfer Agent (MTA)
sudo alternatives --set mta /usr/sbin/sendmail.postfix

#Enable and start the Postfix service
sudo systemctl enable --now postfix

#Permanently allow the SMTP service through the firewall
sudo firewall-cmd --add-service=smtp --permanent

#Reload the firewall to apply changes
sudo firewall-cmd --reload

#Create the use bob
sudo useradd -m -s /bin/bash bob

#Set the password for the user bob
sudo passwd bob

#Send a test email to the user 'tom' on rocky02
echo "Test email from tom" | mail -s "Test email" bob@rocky02.example.com

#Open the mail client to check for new emails
mail

#Select the first email
1

#Quit the mail client
q

#Monitor the mail log in real-time for troubleshooting
sudo tail -f /var/log/maillog