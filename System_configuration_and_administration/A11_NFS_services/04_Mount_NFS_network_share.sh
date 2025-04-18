#Working on Rocky02

#Test connectivity to the NFS server rocky01
ping rocky01

#Create a directory to mount the NFS share
sudo mkdir /home/usermount

#Mount the NFS share from rocky01 to the local directory
sudo mount rocky01:/home/usershare /home/usermount

#Display all currently mounted filesystems
mount

#Create a test file in the mounted NFS share to verify write access
touch /home/usermount/testfile.txt

#List the contents of the mounted directory to verify the test file
ls /home/usermount

#Edit the fstab file to make the NFS mount persistent across reboots
vim /etc/fstab
#rocky01:/home/usershare /home/usermount nfs _netdev 0 0