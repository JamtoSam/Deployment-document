#!/bin/sh
date_install=`/bin/date +%Y%m%d%H%M%S`
#docker commit -p $1 $1
docker stop $1 
#docker save  -o /opt/images/$1-$date_install.tar $1
#echo "已备份"
docker rm $1 

