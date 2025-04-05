#Working on Rocky01

#Start the targetcli utility
sudo targetcli

#Navigate to the root directory
cd /

#List the contents of the root directory
ls

#Navigate to the specific iSCSI target directory
cd /iscsi/iqn.2025-04.com.example:filedisk1/tpg1/

#Display the current working directory
pwd

#Create an access control list (ACL) for the iSCSI target with a specific IQN
acls/ create iqn.2025-04.com.example:client1

#List the contents of the current directory
ls

#Navigate to the newly created ACL directory
cd acls/iqn.2025-04.com.example:client1/

#Display the current working directory
pwd

#Enable authentication for the ACL
set attribute authentication=1

#Set the username for the ACL
set auth userid=client1

#Set the password for the ACL
set auth password=password

#Navigate back to the parent directory
cd ../..

#Display the current working directory
pwd

#List the contents of the current directory
ls

#Exit the targetcli utility
exit