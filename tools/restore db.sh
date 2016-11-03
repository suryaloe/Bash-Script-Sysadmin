#!/bin/bash
file_restore=$1
user_sql="userdb"
pass_sql="passdb"
dbname="namadb" 

TABLES=$(mysql -u $user_sql -p$pass_sql $dbname -e 'show tables' | awk '{ print $1}' | grep -v '^Tables')
for t in $TABLES
do
        echo "Deleting $t table from $MDB database..."
        mysql -u $user_sql -p$pass_sql $dbname -e "drop table $t"
done
mysql -u $user_sql -p$pass_sql $dbname < $1