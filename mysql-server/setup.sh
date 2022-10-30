#!/bin/sh

# update hostname
# ubuntu-server - default hostname
# Smirnov-Nazar - student name
# Mysql - server role
# !need to reboot for update
#sudo sed -i 's/ubuntu-server/Smirnov-Nazar-Mysql/' /etc/hostname
#sudo sed -i 's/ubuntu-server/Smirnov-Nazar-Mysql/' /etc/hosts

# setup netplan
#sudo cp 00-installer-config.yaml /etc/netplan/00-installer-config.yaml
#sudo netplan apply

# add hosts
cat hosts | sudo tee -a /etc/hosts

# isntall dependency
sudo apt install mysql-server
sudo systemctl start mysql

# prepare database
dbname="testdb"

## create test user
sudo mysql < "testuser.sql"
## create db
sudo mysql -e "CREATE DATABASE $dbname"
## create tables
sudo mysql "$dbname" < "structure.sql"
## add test data to db
sudo mysql "$dbname" < "testdata.sql"
## set bind-address to 0.0.0.0 (all interfaces)
sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
## restart mysql
sudo systemctl restart mysql