#Working on Rocky01

#View the Samba configuration file with line numbers
sudo less -N /etc/samba/smb.conf

#Samba Share Options
#comment: Specifies a comment for the share.
#browsable: Determines whether the share is visible in the network.
#writable: Specifies whether the share is writable.
#path: Path to the directory that is shared.
#valid users: Specifies which users are allowed to access the share.
#read only: Specifies whether the share is read-only.
#public: Specifies whether the share is public (accessible to all users).
#wirte list: Specifies whether users can create and delete files in the share.
#guest only: Specifies whether the share is accessible to guest users.
#forece group: Specifies the group that is assigned to files created in the share.
#create mask: Specifies the permissions for files created in the share.

#Use the man page
man smb.conf