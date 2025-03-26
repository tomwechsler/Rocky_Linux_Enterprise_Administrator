#Working on rocky01

#List all active systemd units
sudo systemctl list-units

#List all systemd unit files
sudo systemctl list-unit-files

#Display the status of the systemd system and service manager
sudo systemctl status

#List all systemd unit files of type 'service'
sudo systemctl list-unit-files -t service

#List all active systemd units of type 'service'
sudo systemctl list-units -t service

#List all systemd units of type 'service', including inactive ones
sudo systemctl list-units -at service

#List all running systemd units of type 'service'
sudo systemctl list-units -t service --state running

#Display the contents of the rsyslog service unit file
sudo systemctl cat rsyslog

#Display the status of the rsyslog service
sudo systemctl status rsyslog