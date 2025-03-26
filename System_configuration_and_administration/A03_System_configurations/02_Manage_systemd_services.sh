#Working on rocky01

#List all systemd unit files of type 'service'
sudo systemctl list-unit-files -t service

#Display the status of the atd service
sudo systemctl status atd

#Stop the atd service
sudo systemctl stop atd

#Display the status of the atd service after stopping it
sudo systemctl status atd

#List all active systemd units and filter for the atd service
sudo systemctl list-units | grep atd

#Start the atd service
sudo systemctl start atd

#Display the status of the atd service after starting it
sudo systemctl status atd

#Check if the atd service is active
sudo systemctl is-active atd

#Check if the atd service has failed
sudo systemctl is-failed atd

#Check if the atd service is enabled
sudo systemctl is-enabled atd

#Display the exit status of the last command
echo $?

#Enable and start the atd service
sudo systemctl enable atd --now

#Disable and stop the atd service
sudo systemctl disable atd --now

#Mask the atd service to prevent it from being started
sudo systemctl mask atd

#Attempt to start the atd service (will fail if masked)
sudo systemctl start atd

#Unmask the atd service to allow it to be started
sudo systemctl unmask atd

#Start the atd service after unmasking it
sudo systemctl start atd