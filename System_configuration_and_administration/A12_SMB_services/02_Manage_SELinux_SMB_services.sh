#Working on Rocky01

#View the example Samba configuration file with line numbers
sudo less -N /etc/samba/smb.conf.example

#Display all SELinux booleans related to Samba, SMB, and CIFS
getsebool -a | egrep 'smb|samba|cifs'