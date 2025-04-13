#Working on Rocky01

#Install the DNS server packages
sudo dnf install -y bind bind-utils

#List the content of the installed packages
dnf list installed | grep bind

#Enable and start the DNS server (named)
sudo systemctl enable named --now

#Check the status of the DNS server
sudo systemctl status named

#Check the DNS server logs
sudo tail -f /var/log/messages