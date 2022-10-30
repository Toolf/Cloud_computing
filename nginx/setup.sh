#!/bin/sh

# update hostname
# ubuntu-server - default hostname
# Smirnov-Nazar - student name
# Nginx - server role
# !need to reboot for update
sudo sed -i 's/ubuntu-server/Smirnov-Nazar-Nginx/' /etc/hostname
sudo sed -i 's/ubuntu-server/Smirnov-Nazar-Nginx/' /etc/hosts

# setup netplan
sudo cp 00-installer-config.yaml /etc/netplan/00-installer-config.yaml
sudo netplan apply

# add hosts
cat hosts | sudo tee -a /etc/hosts

# isntall dependency
sudo apt install nginx

sudo systemctl start nginx

# copy nginx.conf
sudo cp nginx.conf /etc/nginx/conf.d/nginx.conf