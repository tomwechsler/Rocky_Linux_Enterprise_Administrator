#Working on Rocky01

#List all downloaded container images
podman images

#Inspect the metadata of the UBI 9 container image using Podman
podman inspect registry.access.redhat.com/ubi9

#Inspect the metadata of the UBI 9 container image using Skopeo
skopeo inspect docker://registry.access.redhat.com/ubi9