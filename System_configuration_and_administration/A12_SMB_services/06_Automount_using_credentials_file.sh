#Working on Rocky02

#Create a credentials file for the Samba private share
sudo vim /root/sambaprivate.cred
#Add the following content:
#username=tom
#password=P@ssw0rd

#Secure the credentials file by setting appropriate permissions
sudo chmod 600 /root/sambaprivate.cred

#Edit the fstab file to add an entry for the Samba private share
sudo vim /etc/fstab
#Add the following line:
#//rocky01/sambaprivate /home/sambaprivateshare cifs credentials=/root/sambaprivate.cred 0 0

#Unmount the Samba private share if it is already mounted
sudo umount /home/sambaprivateshare

#Display the currently mounted filesystems
df

#Reload the systemd manager configuration
sudo systemctl daemon-reload

#Mount all filesystems defined in /etc/fstab
sudo mount -a

#Display the currently mounted filesystems to verify the Samba private share is mounted
df