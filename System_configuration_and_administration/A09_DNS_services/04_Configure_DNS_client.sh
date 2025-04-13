#Working on Rocky02

#View the name service switch configuration file
less /etc/nsswitch.conf

#View the hosts file
less /etc/hosts

#View the DNS resolver configuration file
less /etc/resolv.conf

#Modify the DNS servers for the network interface enp0s7
sudo nmcli connection modify enp0s7 ipv4.dns "8.8.8.8 4.4.2.2"

#Disable automatic DNS configuration for the network interface enp0s7
sudo nmcli connection modify enp0s7 ipv4.ignore-auto-dns yes

#Bring up the network interface enp0s7 with the new settings
sudo nmcli connection up enp0s7

#Edit the NetworkManager configuration file to disable DNS management
sudo vim /etc/NetworkManager/NetworkManager.conf
#Add or modify the following line: dns=none

#Create or edit a custom NetworkManager configuration file to disable DNS management
sudo vim /etc/NetworkManager/conf.d/90-dns-none.conf
#Add the following lines:
#[main]
#dns=none

#Restart the NetworkManager service to apply changes
sudo systemctl restart NetworkManager

#Edit the DNS resolver configuration file to set the desired nameserver
sudo vim /etc/resolv.conf
#Add or modify the nameserver line to point to the DNS server

#Test DNS resolution for a domain
dig google.ch