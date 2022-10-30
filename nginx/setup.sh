#!/bin/sh

# update hostname
# ubuntu - default hostname
# Karpenko-Yaroslav - student name
# Nginx - server role
# !need to reboot for update
sudo sed -i 's/ubuntu/Karpenko-Yaroslav-Nginx/' /etc/hostname
sudo sed -i 's/ubuntu/Karpenko-Yaroslav-Nginx/' /etc/hosts

# setup netplan
#sudo cp 00-installer-config.yaml /etc/netplan/00-installer-config.yaml
#sudo netplan apply

# add hosts
cat hosts | sudo tee -a /etc/hosts

# isntall dependency
sudo apt install nginx

sudo systemctl start nginx

# copy nginx.conf
sudo cp nginx.conf /etc/nginx/conf.d/nginx.conf