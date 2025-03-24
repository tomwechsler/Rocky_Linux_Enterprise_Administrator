#Working on rocky01

#Performance Co-Pilot (PCP) is a system performance analysis toolkit that provides a framework and services to support system-level performance 
#monitoring and management. It is available in the EPEL repository.

sudo dnf install -y epel-release

sudo dnf install -y pcp pcp-gui pcp-doc pcp-system-tools

sudo systemctl enable pmcd --now

pcp

pmstat

/usr/libexec/pcp/bin/pcp-atop

pmchart #Now add the metrics to the chart

#In the Terminal use find / to generate some activity and then use the pmchart command to view the activity in the chart.

#To see more commands use the Redhat documentation
https://access.redhat.com/articles/2372811