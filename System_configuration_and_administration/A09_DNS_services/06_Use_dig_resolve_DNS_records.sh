#Working on Rocky01

#Perform a DNS query for the domain rockylinux.org
dig rockylinux.org

#Perform a DNS query for rockylinux.org and suppress comments, questions, authority, additional, and stats sections
dig rockylinux.org +nocomments +noquestion +noauthority +noadditional +nostats

#Perform a DNS query for rockylinux.org and display only the answer section
dig rockylinux.org +noall +answer

#Perform a DNS query for the MX records of rockylinux.org and display only the answer section
dig rockylinux.org MX +noall +answer

#Perform a DNS query for rockylinux.org and display only the short output
dig rockylinux.org +short

#Perform a reverse DNS lookup for the IP address 76.223.126.88 and display only the short output
dig -x 76.223.126.88 +short

#Perform a DNS query for rockylinux.org using a specific DNS server
dig @dns1.p01.nsone.net rockylinux.org

#Create a file named dnsnames.txt and add the following domain names:
vim dnsnames.txt
#rockylinux.org
#ford.com
#google.ch

#Save the file and exit

#Perform DNS queries for all domain names listed in dnsnames.txt and display only the answer section
dig -f dnsnames.txt +noall +answer