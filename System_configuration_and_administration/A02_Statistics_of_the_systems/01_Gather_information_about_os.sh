#Working on rocky01

#Display the Red Hat release version
cat /etc/redhat-release

#Display the kernel version
uname -r

#Display all system information
uname -a

#Display the system uptime
uptime

#Display the system uptime in a human-readable format
uptime -p

#Display detailed information about the system's hostname and related settings
hostnamectl

#Display kernel ring buffer messages
dmesg

#Display kernel ring buffer messages in a human-readable format
dmesg -H

#Display the amount of free and used memory in the system
free -h

#Display detailed information about memory usage
cat /proc/meminfo

#Display disk space usage in a human-readable format
df -h