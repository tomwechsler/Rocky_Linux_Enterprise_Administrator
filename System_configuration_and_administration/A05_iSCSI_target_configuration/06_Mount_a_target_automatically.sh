#Working on Rocky02

#Display iSCSI devices
sudo lsblk --scsi

#Partition the iSCSI device using gdisk
sudo gdisk /dev/sdd

#Display block devices
lsblk

#Format the partition with the ext4 filesystem
sudo mkfs.ext4 /dev/sdd1

#Display the UUID of the partition
sudo blkid /dev/sdd1

#Create a mount point for the iSCSI target
sudo mkdir /mnt/filedisk1

#Mount the iSCSI target using its UUID
sudo mount <UUID> /mnt/filedisk1

sudo vim /etc/fstab
#<UUID> /mnt/filedisk1 ext4 _netdev 0 0

#Save and exit the file

#Reload the systemd manager configuration
sudo systemctl daemon-reload

#Unmount the iSCSI target from the mount point
sudo umount /mnt/filedisk1

#Mount all filesystems defined in /etc/fstab
sudo mount -a

#Display block devices to verify the mount
lsblk

#Keep in mind that if you're going to reboot either of these machines, you need to shut down the initiator first or the initiator needs to log out of the target. 
#If you shut down the target first, then its drive will be pulled out from under the mount point of the initiator and can halt the initiator from being able to reboot.