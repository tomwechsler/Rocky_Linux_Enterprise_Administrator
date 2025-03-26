#Working on Rocky01

#List the at and cron allow files
ls /etc/at.allow /etc/cron.allow

#List the at and cron deny files
ls /etc/at.deny /etc/cron.deny

#How the allow files work: If the allow file exists, only users listed in the file can use the at or cron commands. 
#If the file does not exist, all users can use the at or cron commands. If the file exists and is empty, no users can use the at or cron commands.
#If a user is in the allow files, the deny files are ignored. The allow files override the deny files.

#How the deny files work: If the deny file exists, users listed in the file cannot use the at or cron commands.
#If the file does not exist, all users can use the at or cron commands. If the file exists and is empty, every user can use the at or cron commands.

#If netheir the allow or deny files exist, then all access is denied.

#We can also controll access with PAM
less -N /etc/security/access.conf

#The lines are commented, if you want to use them, you need to uncomment them.

#The format of the access.conf file is:
-:user1:cron #Minus sign means deny, next the user, and then the origin of the request
+:ALL EXCEPT user1:cron #Plus sign means allow, ALL EXCEPT means all users except the one listed, then the origin of the request
+:user2:cron #Plus sign means allow
-:(user1):cron #Minus sign means deny, in parantheses the group, and then the origin of the request

#Visit the man page access.conf for more
man access.conf