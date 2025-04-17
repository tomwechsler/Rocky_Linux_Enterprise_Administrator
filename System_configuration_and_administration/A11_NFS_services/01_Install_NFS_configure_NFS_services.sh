#Working on Rocky01

#Install the NFS utilities package
sudo dnf install -y nfs-utils

#List the contents of the installed NFS utilities package
rpm -ql | grep nfs-utils

#Install the NFS ACL tools package
sudo dnf install -y nfs4-acl-tools

#List the contents of the installed NFS ACL tools package
rpm -ql | grep nfs4-acl-tools

#Switch to Rocky02

#Install the NFS utilities package and NFS ACL tools package
sudo dnf install -y nfs-utils nfs4-acl-tools