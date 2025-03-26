#Documentation

#Man page section 5 for systemd timer
man 5 systemd.timer

#Service Unit
[Unit]
Description="Back up the etc directory"

[Service]
ExecStart=tar -czf /root/etc.tgz /etc

The timer unit will run a service unit. The service unit will not have the [Install]
section meaning that it cannot be enabled.

#Timer Unit
[Unit]
Description="Run backup of etc once a day"

[Timer]
OnBootSec=5min
OnUnitActiveSec=24h
Unit=backup.service

[Install]
WantedBy=multi-user.target