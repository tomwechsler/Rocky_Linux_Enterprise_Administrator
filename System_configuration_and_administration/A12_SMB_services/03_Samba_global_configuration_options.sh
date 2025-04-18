#Working on Rocky01

#View the Samba configuration file with line numbers
sudo less -N /etc/samba/smb.conf

#Samba Global Options
#workgroup: Specifies the workgroup or domain in which the Samba server is displayed (default: WORKGROUP).
#server string: A description of the server that is visible in the network.
#security: Specifies the authentication mode (e.g. user, share, domain, ads).
#log file: Path to the log file in which Samba writes log messages.
#max log size: Limits the size of the log files (in kilobytes).
#dns proxy: Activates or deactivates DNS name resolution if NetBIOS fails.
#protocol / min protocol / max protocol: Determines which SMB protocol versions may be used (e.g. SMB2, SMB3).
#load printers: Specifies whether printers should be automatically recognized and released.
#printing: Specifies the printing system (e.g. cups, bsd).