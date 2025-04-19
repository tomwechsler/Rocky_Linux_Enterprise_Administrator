#Working on Rocky01

#Create a directory to store container images locally
mkdir -p $HOME/.local/share/images

#Copy the Nginx container image from Docker Hub to the local directory
skopeo copy docker://docker.io/nginx:latest dir:/$HOME/.local/share/images/nginx

#List the contents of the local images directory
ls $HOME/.local/share/images

#View the manifest file of the Nginx container image
cat $HOME/.local/share/images/nginx/manifest.json

#List all downloaded container images
podman images

#Tag the UBI 9 container image with a custom name 'myubi'
podman tag registry.access.redhat.com/ubi9 myubi

#List all container images to verify the new tag
podman images

#Tag the UBI 9 container image with a custom name and version 'myubi:9'
podman tag registry.access.redhat.com/ubi9 myubi:9

#List all container images to verify the new tag
podman images

#Save the UBI 9 container image to a tar file
podman save -o myubi9.tar registry.access.redhat.com/ubi9

#Remove the UBI 9 container image
podman rmi registry.access.redhat.com/ubi9

#List all container images to confirm the removal
podman images

#Load the UBI 9 container image from the tar file
podman load -i myubi9.tar

#List all container images to verify the image is loaded
podman images

#Run a container in detached mode using the UBI 9 image
podman run -dt --name=testubi registry.access.redhat.com/ubi9

#List all containers, including the running container
podman ps -a #Copy the container ID

#Attach to the running container
podman attach testubi

#Create a test file inside the container
echo "This is a test container" > testfile.txt

#Detach from the container without stopping it
ctrl +P +Q

#Export the container to a tar file
podman export -o testubi.tar <container_id>

#List the contents of the exported tar file
tar -tf testubi.tar

#Import the exported container tar file as a new image
podman import testubi.tar testubi-imported

#List all container images to verify the imported image
podman images

#Run a container from the imported image and display the test file content
podman run -it --name=testubi-imported localhost/testubi-imported cat testfile.txt