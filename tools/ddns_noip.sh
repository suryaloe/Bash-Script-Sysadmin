#!/bin/bash

hostname="hostname.ddns.net"
user="usernoip"
pass="passnoip"
url="http://dynupdate.no-ip.com/nic/update?hostname=$hostname&myip="
log="/var/log/ddns_noip"

registered=$(nslookup $hostname|tail -n2|grep A|sed s/[^0-9.]//g)
current=$(wget -q -O - http://ipinfo.io/ip)

if [ "$current" != "$registered" ]
then
        update_dns=$(wget -q -O - "$url$current" --user=$user --password=$pass)
        echo "DDNS Updated On: " `date` "IP : " $current > $log
        echo "DDNS Updated On: " `date` "IP : " $current
fi
