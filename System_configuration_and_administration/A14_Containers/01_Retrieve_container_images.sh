#Working on Rocky01

#Install container tools on Rocky01
sudo dnf install container-tools

#Display the Podman version
podman version

#Run a test container to verify Podman installation
podman run hello-world

#List all containers (including stopped ones)
podman ps -a

#Display Podman configuration information in JSON format and filter for registries
podman info -f json | jq '.registries.search'

#View the container registries configuration file with line numbers
less -N /etc/containers/registries.conf

#Search for the 'busybox' container image in the default registries
podman search busybox

#Search for container images in the Docker Hub registry
podman search docker.io

#Run a container interactively using the 'busybox' image from Docker Hub
podman run -it docker.io/library/busybox

#List the contents of the container's root filesystem
ls

#Exit the interactive container session
exit

#Pull the Universal Base Image (UBI) 9 from the Red Hat registry
podman pull registry.access.redhat.com/ubi9

#List all downloaded container images
podman images