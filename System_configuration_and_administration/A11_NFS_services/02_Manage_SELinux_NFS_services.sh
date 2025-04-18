#Working on Rocky01

#Enable and start the NFS server service
sudo systemctl enable --now nfs-server

#Display SELinux security contexts for NFS and RPC processes
ps -eZ | egrep 'nfs|rpc'

#List SELinux security contexts for the NFS exports configuration file
ls -lZ /etc/exports

#Display all SELinux booleans related to NFS
getsebool -a | grep nfs