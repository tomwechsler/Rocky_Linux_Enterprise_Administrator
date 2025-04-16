#Working on Rocky03

#Display all SELinux booleans related to the HTTPD service
getsebool -a | grep httpd

#Install the SELinux policy development tools
sudo dnf install -y selinux-policy-devel

#Generate SELinux man pages for all installed modules and place them in the specified directory
sudo sepolicy manpage -a -p /usr/local/man/man8.mandb

#View the SELinux manual page for the HTTPD service
man httpd_selinux