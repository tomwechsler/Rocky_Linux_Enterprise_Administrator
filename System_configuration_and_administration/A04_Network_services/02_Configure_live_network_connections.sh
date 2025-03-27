#Working on Rocky01

#Display network interfaces and their configurations
ifconfig

#Display IP addresses and statistics for network interfaces
ip -s addr

#Display the kernel routing table
route

#Display the IP routing table
ip route

#Display the link status of the network interface enp0s8
sudo mii-tool enp0s8

#Display detailed information about the network interface enp0s8
sudo ethtool enp0s8

#Display the ARP table
arp

#Display the neighbor table (similar to ARP)
ip neigh

#Assign the IP address 172.16.25.125/24 to the network interface enp0s8
sudo ifconfig enp0s8 172.16.25.125/24

#Add the IP address 172.16.25.125/24 to the network interface enp0s8
sudo ip addr add 172.16.25.125/24 dev enp0s8

#Remove the IP address 172.16.25.125/24 from the network interface enp0s8
sudo ip addr delete 172.16.25.125/24 dev enp0s8

#Add a route to the network 192.168.1.0/24 via the interface eth0
route add -net 192.168.1.0 netmask 255.255.255.0 dev eth0

#Add a route to the network 192.168.1.0/24 via the interface eth0 using ip command
ip route add 192.168.1.0/24 dev eth0

#Add a default gateway with IP 192.168.1.1
route add default gw 192.168.1.1

#Add a default route via the gateway 192.168.1.1
ip route add default via 192.168.1.1

#Display network connections, routing tables, and statistics
netstat -neopa

#Display network connections, routing tables, and statistics using ss command
ss -neopa