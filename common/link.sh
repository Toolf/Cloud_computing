#!/bin/sh

files=`ls -I link.sh`
for file in $files
do
    ln $file ../http-server/$file
    ln $file ../mysql-server/$file
    ln $file ../nginx/$file
done
