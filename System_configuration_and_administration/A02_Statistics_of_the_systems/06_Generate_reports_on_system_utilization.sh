#Working on rocky01

#List the contents of the /var/log/sa directory
ls /var/log/sa

#Generate a report for the entire day from the sa10 file
sudo sadf -s 00:00:00 -e 23:59:59 /var/log/sa/sa10

#Generate a report in XML format for the entire day from the sa10 file
sudo sadf -s 00:00:00 -e 23:59:59 /var/log/sa/sa10 -x

#Generate a report in CSV format for the entire day from the sa10 file
sudo sadf -s 00:00:00 -e 23:59:59 /var/log/sa/sa10 -d

#Generate a graphical report for the entire day from the sa10 file and save it as an SVG file
sudo sadf -s 00:00:00 -e 23:59:59 /var/log/sa/sa10 -g > /tmp/report.svg

#Open the generated SVG report in Firefox
firefox /tmp/report.svg

#Generate a detailed report for the entire day from the sa10 file
sudo sadf -s 00:00:00 -e 23:59:59 /var/log/sa/sa10 -- -d

#Generate a CPU utilization report for the entire day from the sa10 file
sudo sadf -s 00:00:00 -e 23:59:59 /var/log/sa/sa10 -- -u

#Generate a memory utilization report for the entire day from the sa10 file, including device statistics
sudo sadf -s 00:00:00 -e 23:59:59 /var/log/sa/sa10 -- -r -n DEV