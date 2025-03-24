#In Linux there are two main logging systems: rsyslog and journald. The rsyslog system is older and is being replaced by journald. 
#The rsyslog system uses the /var/log/messages file to store log messages. The journald system uses the journalctl command to display log messages. 
#The journald logs are not stored peristent by default. To store the logs persistently, the /etc/systemd/journald.conf file must be edited.

#The rsyslog log rules as follows:
news.crit /var/log/spooler # Log all messages with the 'crit' priority from the 'news' facility to the /var/log/spooler file
*.emerg * # Log all messages with the 'emerg' priority to all available log files

#The selector field is used to specify the facility and priority of the log message. The facility is the type of program that generated the message.
#For example:
*.info,mail.none;authpriv.none # Log all messages with the 'info' priority except for messages from the 'mail' and 'authpriv' facilities

#The rsyslog facility codes are as follows:
#auth - 1
#authpriv - 2
#cron - 3
#daemon - 4
#kern - 0
#lpr - 6
#mail - 5

#The rsyslog priority codes are as follows:
#emerg - 0
#alert - 1
#crit - 2
#err - 3
#warning - 4
#notice - 5
#info - 6
#debug - 7


#Working on rocky01

#Display the contents of the rsyslog configuration file with line numbers
less -N /etc/rsyslog.conf

#Display the contents of the /var/log/messages file
sudo cat /var/log/messages

#Display the contents of the /var/log/messages file excluding lines containing 'systemd'
sudo grep -v 'systemd' /var/log/messages

#Display the contents of the /var/log/messages file excluding lines containing 'systemd' or 'journal'
sudo grep -vE 'systemd|journal' /var/log/messages

#Continuously display the last lines of the /var/log/messages file
sudo tail -f /var/log/messages

#Display log messages from the journal
journalctl

#Display log messages related to the crond service
journalctl /sbin/crond

#Display log messages for the crond service unit
journalctl -u crond.service

#Continuously display log messages from the journal
journalctl -f