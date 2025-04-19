#Working on Rocky01

#Create a Podman container named 'serviceubi' using the UBI 9 image
podman create --name serviceubi registry.access.redhat.com/ubi9 sleep infinity

#Create a directory for user-specific systemd service files
mkdir -p $HOME/.config/systemd/user

#Generate a systemd service file for the 'serviceubi' container
podman generate systemd --name serviceubi > $HOME/.config/systemd/user/container-serviceubi.service

#View the generated systemd service file
cat $HOME/.config/systemd/user/container-serviceubi.service

#Enable lingering for the user 'tom' to allow user services to run after logout
sudo loginctl enable-linger tom

#Reload the systemd manager configuration for the user
systemctl --user daemon-reload

#List all user-specific systemd service unit files
systemctl --user list-unit-files -t service

#Enable the systemd service for the 'serviceubi' container
systemctl --user enable container-serviceubi.service

#Start the systemd service for the 'serviceubi' container
systemctl --user start container-serviceubi.service

#List all user-specific systemd service unit files to verify the service is enabled
systemctl --user list-unit-files -t service

#List all containers, including the running 'serviceubi' container
podman ps -a