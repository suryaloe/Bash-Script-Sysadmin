#!/bin/bash
DOMAIN="domain.com"
registered=$(nslookup $DOMAIN|tail -n2|grep A|sed s/[^0-9.]//g)
UPDATEURL="LINK Afraid Dynamic Update"
UPDATEURL2="LINK Afraid Dynamic Update"
log="/var/log/dns_log"

current=$(wget -q -O - http://ipinfo.io/ip)
[ "$current" != "$registered" ] && {
wget -q -O - $UPDATEURL
wget -q -O - $UPDATEURL2
echo "Afraid updated on:" `date` "IP :" $current >> $log
}
