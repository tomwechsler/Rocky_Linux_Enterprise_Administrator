#Working on Rocky01

#Create a Podman volume named 'hostvol'
podman volume create hostvol

#Inspect the details of the 'hostvol' volume
podman volume inspect hostvol

#Write a message to a file in the 'hostvol' volume from the host
echo "Message from Host" >> /home/tom/.local/share/containers/storage/volumes/hostvol/_data/hostmessage.txt

#List the contents of the 'hostvol' volume directory on the host
ls /home/tom/.local/share/containers/storage/volumes/hostvol/_data/

#Run a container and mount the 'hostvol' volume to the '/containervol' directory inside the container
podman run -it -v hostvol:/containervol registry.access.redhat.com/ubi9 /bin/bash

#List the contents of the '/containervol' directory inside the container
ls /containervol

#Write a message to a file in the '/containervol' directory from the container
echo "Message from Container" >> /containervol/containermessage.txt

#Detach from the container without stopping it
ctrl +p and ctrl +q

#List the contents of the 'hostvol' volume directory on the host to verify the container's changes
ls /home/tom/.local/share/containers/storage/volumes/hostvol/_data/