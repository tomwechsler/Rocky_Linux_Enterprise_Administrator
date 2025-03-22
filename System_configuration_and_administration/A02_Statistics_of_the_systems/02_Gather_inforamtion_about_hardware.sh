#Working on rocky01

#Display detailed information about the system's hardware
sudo dmidecode

#Display BIOS information
sudo dmidecode --type bios

#Display system information
sudo dmidecode --type system

#Display the system family
sudo dmidecode -s system-family

#Display all DMI information
sudo cat /sys/devices/virtual/dmi/id/

#Display the board vendor
sudo cat /sys/devices/virtual/dmi/id/board_vendor

#Display detailed information about USB devices
lsusb -v

#Display information about PCI devices
lspci

#Display information about the CPU architecture
lscpu

#Display detailed information about the CPU
cat /proc/cpuinfo

#Display information about block devices
lsblk

#Display information about block devices with filesystems
lsblk -f

#Display block device attributes
blkid