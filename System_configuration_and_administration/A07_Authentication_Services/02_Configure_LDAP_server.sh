#Working on Rocky01

#Generate a password hash for the LDAP root password
slappasswd

#Copy the generated password hash

vim rootpw.ldif

#Paste the password hash in the rootpw.ldif file => save and exit

#Add the root password configuration to the LDAP server
sudo ldapadd -Y EXTERNAL -H ldapi:/// -f rootpw.ldif

#Add the COSINE schema to the LDAP server
sudo ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif

#Add the NIS schema to the LDAP server
sudo ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif

#Add the InetOrgPerson schema to the LDAP server
sudo ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif

#Generate a password hash for the LDAP root password
slappasswd

#Copy the generated password hash

vim domain.ldif

#Replace olcRootPW with the generated password hash => save and exit

#Modify the LDAP server configuration with the domain settings
sudo ldapmodify -Y EXTERNAL -H ldapi:/// -f domain.ldif

#Add the base domain entries to the LDAP server
sudo ldapadd -x -D "cn=Manager,dc=example,dc=com" -W -f basedomain.ldif