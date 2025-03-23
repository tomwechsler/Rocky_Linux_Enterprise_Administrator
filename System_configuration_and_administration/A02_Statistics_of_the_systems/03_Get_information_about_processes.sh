#Working on rocky01

#Display current processes
ps

#Display the manual for the ps command
man ps

#Display all processes
ps -e

#Display all processes in a hierarchical format
ps -eH

#Display all processes with full format listing
ps -ef

#Display all processes with extra full format listing
ps -eF

#Display all processes with long format listing
ps -elF

#Display all processes with custom format (UID, PID, PPID, CMD, %CPU, %MEM)
ps -e --format uid,pid,ppid,cmd,%cpu,%mem

#Display all processes sorted by CPU usage (ascending)
ps -e --format uid,pid,ppid,cmd,%cpu,%mem --sort %cpu

#Display all processes sorted by CPU usage (descending)
ps -e --format uid,pid,ppid,cmd,%cpu,%mem --sort -%cpu

#Display all processes owned by the root user
ps -U root

#Display all processes
ps -e

#Open a new tab
#Display processes with the command name 'bash'
ps -C bash

#Display processes with the command name 'bash' with custom format (PID, CMD, %CPU, %MEM) sorted by CPU usage
ps -C bash --format pid,cmd,%cpu,%mem --sort %cpu

#Display memory usage of all processes owned by the user 'tom' and sum it up
ps -U tom --format %mem | awk '{memory += $1} END {print memory}'