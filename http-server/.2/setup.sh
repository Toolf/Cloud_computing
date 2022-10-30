#!/bin/sh

# update hostname
# niksonax-server - default hostname
# Nikita-Kaniuka - student name
# Http - server role
# !need to reboot for update
sudo sed -i 's/niksonax-server/Nikita-Kaniuka-Http.2/' /etc/hostname
sudo sed -i 's/niksonax-server/Nikita-Kaniuka-Http.2/' /etc/hosts

# setup netplan
#sudo cp 00-installer-config.yaml /etc/netplan/00-installer-config.yaml
#sudo netplan apply

# add hosts
cat ../hosts | sudo tee -a /etc/hosts

# isntall dependency
sudo apt install apache2 php php php-mysql

sudo systemctl start apache2

sudo cp ./index.php /var/www/html/index.php
sudo cp ./get_info.php /var/www/html/get_info.php

sudo systemctl restart apache2