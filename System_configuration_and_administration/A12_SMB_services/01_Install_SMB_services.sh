#Working on Rocky01

#Install Samba server, client, and common tools on Rocky01
sudo dnf install -y samba samba-client samba-common-tools

#List all installed packages related to Samba or CIFS
rpm -qa | egrep 'smb|samba|cifs'

#Switch to Rocky02

#Install the Samba client and utilities on Rocky02
sudo dnf install -y cifs-utils samba-client samba-common-tools

#Edit the fstab file to remove the NFS mount entry
sudo vim /etc/fstab
#Remove the line:
#rocky01:/home/usershare /home/usermount nfs _netdev 0 0

#Unmount the NFS share from the local directory
sudo umount /home/usermount