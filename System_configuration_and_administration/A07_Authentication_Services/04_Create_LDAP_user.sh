#Working on Rocky01

#Generate a password hash for the LDAP root password
slappasswd

#Copy the generated password hash

vim mkuser.ldif

#Replace the userPassword hash => save and exit

#Add a new LDAP user using the mkuser.ldif file
sudo ldapadd -x -D "cn=Manager,dc=example,dc=com" -W -f mkuser.ldif

#Search for the LDAP user with the common name 'rhuser'
sudo ldapsearch -x cn=rhuser -b "dc=example,dc=com"

#IF NEEDED - Delete the LDAP user with the UID 'rhuser'
sudo ldapdelete -x -W -D "cn=Manager,dc=example,dc=com" "uid=rhuser,ou=People,dc=example,dc=com"