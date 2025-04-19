#Working on Rocky02

#Display SELinux security contexts for Postfix processes
ps -AZ | grep postfix

#List SELinux security contexts for Postfix directories
ls -ldZ /etc/postfix /var/lib/postfix /var/spool/postfix

#List all SELinux port contexts related to SMTP
sudo semanage port -l | grep smtp

#Display all SELinux booleans related to Postfix
getsebool -a | grep postfix