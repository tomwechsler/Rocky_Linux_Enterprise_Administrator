#Working on Rocky01

#Edit the nfs.conf with an editor or use nfsconf command to configure the NFS server

#Configure the NFS server
sudo nfsconf --set nfsd vers4 y

#Enable TCP protocol for NFS server
sudo nfsconf --set nfsd tcp y

#Disable UDP protocol for NFS server
sudo nfsconf --set nfsd udp n

#Disable NFS version 3 for NFS server
sudo nfsconf --set nfsd vers3 n

#Check the configuration
sudo vim /etc/nfs.conf

#Enable and start the NFS server service immediately
sudo systemctl restart nfs-server

#Display listening TCP ports and their status
ss -ntl

#Display the supported NFS versions by the NFS server
sudo cat /proc/fs/nfsd/versions

#Mask some services
sudo systemctl mask --now rpc-statd.service rpcbind.service rpcbind.socket

#Create a new directory for NFS shares
sudo mkdir /home/usershare

#NFS passes Unix permissions to the client. Server and client must have the same UID and GID for the user and group.
sudo chown tom:tom /home/usershare

#Set the permissions for the /home/usershare directory
sudo chmod 770 /home/usershare

#Display the SELinux security context for the /home/usershare directory
ls -ldZ /home/usershare

#Add a file context rule to label the /home/usershare directory and its contents with the nfs_t type
semanage fcontext -a -t nfs_t "/home/usershare(/.*)?"

#Apply the SELinux context rules to the /home/usershare directory and its contents
restorecon -Rv /home/usershare

#Configure the NFS export
sudo vim /etc/exports
#/home/usershare rocky02(rw)

# Test connectivity to the client machine rocky02
ping rocky02

# Set the default firewall zone to 'public'
sudo firewall-cmd --set-default-zone=public

# Permanently allow the NFS service through the firewall
sudo firewall-cmd --add-service=nfs --permanent

# Reload the firewall to apply changes
sudo firewall-cmd --reload

# Restart the NFS server to apply configuration changes
sudo systemctl restart nfs-server

# Display the current NFS exports table
sudo cat /var/lib/nfs/etab

# Check the mapping of the nobody user (UID 65534) in the passwd file
grep 65534 /etc/passwd