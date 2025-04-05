#Working on Rocky01

#Set the default firewall zone to 'public'
sudo firewall-cmd --set-default-zone=public

#Display all active TCP connections
sudo netstat -at

#Display all active TCP connections with numeric addresses and ports
sudo netstat -atn

#Permanently allow the iSCSI target service through the firewall
sudo firewall-cmd --permanent --add-service=iscsi-target

#Reload the firewall to apply changes
sudo firewall-cmd --reload

#List all current firewall settings
sudo firewall-cmd --list-all