#Working on Rocky01

#Run a container and display the OS release information
podman run --rm registry.access.redhat.com/ubi9 cat /etc/os-release

#Run a container interactively with a bash shell
podman run -it registry.access.redhat.com/ubi9 /bin/bash

#Install the zip package inside the container
dnf install -y zip

#Open a second terminal and list all running containers
podman ps

#List all containers, including stopped ones
podman ps -a

#Stop a specific container using its container ID
podman stop <container_id>

#List all running containers to confirm the container has stopped
podman ps

#Back on the first terminal, start the stopped container and attach to it
podman start -a <container_id>

#Back on the second terminal, list all containers, including stopped ones
podman ps -a

#Stop all running containers
podman stop -a

#List all containers to confirm they are stopped
podman ps -a