#Working on Rocky01

#Configure hostname
sudo hostnamectl set-hostname rocky01

#Cat the /etc/hosts file
sudo cat /etc/hosts

#The global namesserver configuration file
sudo cat /etc/resolv.conf

#The network interface configuration file
sudo ls /etc/NetworkManager/system-connections/

#The legacy network interface configuration file
sudo ls /etc/sysconfig/network-scripts/

#Network interface settings (nmcli)
sudo nmcli connection show

#List the ip addresses
ip addr show

#The legacy way
ifconfig

#The nmtui tool
sudo nmtui