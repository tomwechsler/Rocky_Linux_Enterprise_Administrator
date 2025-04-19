#Working on Rocky01

#Run a container interactively using the UBI 9 image
podman run -it --name myubi registry.access.redhat.com/ubi9

#Install the zsh shell inside the container
dnf install zsh

#Exit the container
exit

#Create a directory for the custom container build
mkdir myhttpd

#Change to the newly created directory
cd myhttpd

#Create a Containerfile for building a custom container image
vim Containerfile
#Add the following content:
#FROM registry.access.redhat.com/ubi9/ubi-init
#RUN dnf -y install httpd; dnf clean all; systemctl enable httpd
#RUN echo "Successful Web Server Test" > /var/www/html/index.html
#RUN mkdir /etc/systemd/system/httpd.service.d/; echo -e '[Service]\nRestart=always' > /etc/systemd/system/httpd.service.d/httpd.conf
#EXPOSE 80
#CMD ["/sbin/init"]

#Build the custom container image using the Containerfile
podman build --format=docker -t myhttpd .

#Enable SELinux boolean to allow container management of cgroups
sudo setsebool -P container_manage_cgroup 1

#Allow unprivileged processes to bind to port 80
sudo sysctl net.ipv4.ip_unprivileged_port_start=80

#Run the custom container in detached mode and map port 80
podman run -d --name=myhttpd_run -p 80:80 myhttpd

#List all running containers
podman ps

#Test the web server by accessing the index.html file
curl localhost/index.html