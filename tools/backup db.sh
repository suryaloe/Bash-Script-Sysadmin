#!/bin/bash

user="namauser"
pass="cobatebak"
dbname="namadb"
destination = "/etc/bak/"

now=$(date +'%d_%m_%Y_%H_%M')
mysqldump -u root -p$pass $dbname > $destination$now.sql
tot=$(ls -al $destination | wc -l)
if [ "$tot" -gt 7 ]; then
        cd $destination
        ls -t | tail -n 2 | xargs -r rm -rf
fi