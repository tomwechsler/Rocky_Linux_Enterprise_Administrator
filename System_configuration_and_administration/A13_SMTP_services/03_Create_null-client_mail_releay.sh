#Working on Rocky03

#Install Postfix and the s-nail mail client
sudo dnf install -y postfix s-nail

#Edit the Postfix main configuration file
sudo vim /etc/postfix/main.cf
#Add or modify the following lines:
#myhostname = rocky03.example.com
#mydomain = example.com
#inet_interfaces = localhost
#mydestination = 
#relayhost = rocky02.example.com
#disable_dns_lookups = yes (at the end of the file)

#Enable and start the Postfix service
sudo systemctl enable --now postfix

#Monitor the mail log in real-time for troubleshooting (in a separate terminal)
sudo tail -f /var/log/maillog

#Send a test email to the user 'tom' on rocky02
date | mail -s "This is a null-client relay test" tom@rocky02.example.com

#Switch to Rocky02

#Open the mail client to check for new emails
mail

#Quit the mail client
q

#Monitor the mail log on Rocky02 in real-time for troubleshooting
sudo tail -f /var/log/maillog