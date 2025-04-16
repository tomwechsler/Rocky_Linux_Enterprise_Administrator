#Working on Rocky03

#Display the contents of the welcome configuration file
cat /etc/httpd/conf.d/welcome.conf

#<Directory /usr/share/httpd/noindex>
#    AllowOverride None
#    Require all granted
#</Directory>

#Apache User Access Control
#The Apache HTTP server uses the Directory directive to control access to directories and files.
#Require user <name or UID>
#Not require user <name or UID>
#Require group <name or GID>
#Not require group <name or GID>
#Require vaild user