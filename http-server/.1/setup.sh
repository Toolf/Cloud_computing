#!/bin/sh

# update hostname
# ubuntu-server - default hostname
# Smirnov-Nazar - student name
# Http - server role
# !need to reboot for update
sudo sed -i 's/ubuntu-server/Smirnov-Nazar-Http.1/' /etc/hostname
sudo sed -i 's/ubuntu-server/Smirnov-Nazar-Http.1/' /etc/hosts

# setup netplan
sudo cp 00-installer-config.yaml /etc/netplan/00-installer-config.yaml

# add hosts
cat ../hosts | sudo tee -a /etc/hosts

# isntall dependency
sudo apt install apache2 php mysqlnd

sudo systemctl enable apache2

cp ./index.php /var/www/html/index.php

