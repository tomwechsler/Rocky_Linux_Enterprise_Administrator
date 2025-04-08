#Working on Rocky02

#Open the following file
sudo vim /etc/iscsi/initiatorname.iscsi

#Replace the Initiatorname
Initiatorname=iqn.2025-04.com.example:client1

#Save and exit the file

#Open the iscsid configuration file
sudo vim /etc/iscsi/iscsid.conf

#Navigate to the CHAP authentication section
#Uncomment the following lines:
node.session.auth.username = client1
node.session.auth.password = password

#Uncomment the following line:
node.session.auth.type = CHAP

#Save and exit the file

#Restart the iSCSI daemon
sudo systemctl restart iscsid

#Restart the iSCSI service
sudo systemctl restart iscsi

#Discover available iSCSI targets on the specified portal
sudo iscsiadm --mode discovery --type sendtargets --portal 192.168.100.48

#Log in to the specified iSCSI target
sudo iscsiadm --mode node --targetname iqn.2025-04.com.example:filedisk1 --portal 192.168.100.48 --login

#Display SCSI devices
sudo lsblk --scsi

#Display block devices and filter for specific device names
sudo lsblk | egrep "NAME|sdd"

################
#Troubleshooting
################

#Delete old credentials
sudo iscsiadm -m node -o delete

#Verify username and password (-P 2 is the print level and -S shows secrets)
sudo iscsiadm -m session -P 2 -S

#Logout from the iSCSI target
sudo iscsiadm --mode node --targetname iqn.2025-04.com.example:filedisk1 --portal 192.168.100.48 --logout

#Verify username and password (-P 2 is the print level and -S shows secrets)
sudo iscsiadm -m session -P 2 -S

#Log in to the specified iSCSI target
sudo iscsiadm --mode node --targetname iqn.2025-04.com.example:filedisk1 --portal 192.168.100.48 --login