#Working on rocky01

#Install the sysstat package
sudo dnf install -y sysstat

#Enable and start the sysstat service
sudo systemctl enable sysstat --now

#List the sysstat timers
sudo systemctl list-timers *sysstat*

#Display the contents of the sysstat-collect.timer file
cat /etc/systemd/system/sysstat.service.wants/sysstat-collect.timer

#Display the contents of the sysstat-summary.timer file
cat /etc/systemd/system/sysstat.service.wants/sysstat-summary.timer

#Display the contents of the sysstat configuration file
cat /etc/sysconfig/sysstat

#Display CPU usage every 2 seconds for 5 intervals
sar -u 2 5

#Display CPU usage every 2 seconds until interrupted
sar -u 2

#Display all sar statistics
sar -A

#Display the manual for the sar command
man sar

#Display virtual memory statistics
vmstat

#Display a summary of virtual memory statistics
vmstat -s

#Display disk statistics
vmstat -d