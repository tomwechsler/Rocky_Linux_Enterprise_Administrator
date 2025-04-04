#Working on Rocky01

#Install the required packages
sudo dnf install -y targetcli

#Enable and start the target service
sudo systemctl enable --now target

#Check the status of the target service
sudo systemctl status target

#Install iSCSI initiator Utilities
sudo dnf install -y iscsi-initiator-utils

#Enable and start the iscsid service
sudo systemctl enable --now iscsid

#Check the status of the iscsid service
sudo systemctl status iscsid

#Enable and start the iscsi service
sudo systemctl enable --now iscsi

#Check the status of the iscsi service
sudo systemctl status iscsi