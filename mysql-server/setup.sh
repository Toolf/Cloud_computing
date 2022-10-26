#!/bin/sh

# update hostname
# ubuntu-server - default hostname
# Smirnov-Nazar - student name
# Mysql - server role
# !need to reboot for update
sudo sed -i 's/ubuntu-server/Smirnov-Nazar-Mysql/' /etc/hostname
sudo sed -i 's/ubuntu-server/Smirnov-Nazar-Mysql/' /etc/hosts

# setup netplan
sudo cp 00-installer-config.yaml /etc/netplan/00-installer-config.yaml

# add hosts
cat hosts | sudo tee -a /etc/hosts

# isntall dependency
sudo apt install mysql

# prepare database
dbname="testdb"

## create test user
sudo mysql "$testdb" < "testuser.sql"
# create db
sudo mysql -e "create database $testdb"
# create tables
sudo mysql "$testdb" < "structure.sql"
# add test data to db
sudo mysql "$testdb" < "testdata.sql"
