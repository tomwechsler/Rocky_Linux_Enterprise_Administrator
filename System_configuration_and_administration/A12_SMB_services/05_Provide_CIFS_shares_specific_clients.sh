#Working on Rocky01

#Create a directory for the Samba private share
sudo mkdir /home/sambaprivate

#Set ownership of the Samba private share directory to the user 'tom'
sudo chown -R tom:tom /home/sambaprivate

#Set permissions for the Samba private share directory
sudo chmod -R 770 /home/sambaprivate

#Add a file context rule to label the Samba private share directory with the samba_share_t type
sudo semanage fcontext -a -t samba_share_t "/home/sambaprivate(/.*)?"

#Apply the SELinux context rules to the Samba private share directory
sudo restorecon -Rv /home/sambaprivate

#List the SELinux security context of the Samba private share directory
ls -ldZ /home/sambaprivate

#Set the default firewall zone to 'public'
sudo firewall-cmd --set-default-zone=public

#Permanently allow the Samba service through the firewall
sudo firewall-cmd --add-service=samba --permanent

#Reload the firewall to apply changes
sudo firewall-cmd --reload

#Edit the Samba configuration file to add the private share
sudo vim /etc/samba/smb.conf
#Add the following content:
#[sambaprivate]
#   comment = Samba Private Share
#   path = /home/sambaprivate
#   writable = yes
#   valid users = tom
#   write list = tom

#Test the Samba configuration for syntax errors
testparm

#Add the user 'tom' to the Samba password database
sudo smbpasswd -a tom

#List all Samba users and their details
sudo pdbedit -Lv

#Enable and start the Samba service
sudo systemctl enable --now smb.service

#List all available Samba shares on the localhost
smbclient -NL //localhost

#Switch to Rocky02

#Access the Samba private share from Rocky02
smbclient //rocky01/sambaprivate -U tom

#List the contents of the Samba private share
ls

#Exit the Samba client
quit

#Create a directory to mount the Samba private share
sudo mkdir /home/sambaprivateshare

#Mount the Samba private share to the local directory
sudo mount -o username=tom,uid=1000 //rocky01/sambaprivate /home/sambaprivateshare

#Display the mounted filesystems
df

#Create a test file in the mounted Samba private share to verify write access
touch /home/sambaprivateshare/testfile.txt