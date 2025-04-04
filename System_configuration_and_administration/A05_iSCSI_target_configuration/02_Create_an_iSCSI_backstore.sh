#Working on Rocky01

#Start the targetcli utility
sudo targetcli

#Use ls
ls

#Create a file-based iSCSI backstore with a 200MB disk image and write-back caching disabled
/backstores/filieio create file1 /tmp/disk1.img 200M wirte_back=false

#List the current configuration
ls

#Navigate to the iSCSI configuration directory
cd /iscsi

#List the current iSCSI targets
ls

#Creates a new auto generated iSCSI target
create

#List the iSCSI targets after creation
ls

#Create an iSCSI target with a specific IQN
create iqn.2025-04.com.example:filedisk1

#List the iSCSI targets to confirm the new target was created
ls

#Copy the auto generated IQN to the clipboard
delete <paste in the IQN from the clipboard>

#List the current configuration
ls

#Navigate to the root directory
cd /

#List the contents of the root directory
ls

#Navigate to the specific iSCSI target directory
cd /iscsi/iqn.2025-04.com.example:filedisk1/tpg1/

#Create a LUN (Logical Unit Number) for the iSCSI target using the file-based backstore
luns/ create /backstores/fileio/file1

#List the configuration to confirm the LUN creation
ls