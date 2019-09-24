#!/bin/bash
date_install=`/bin/date +%Y%m%d%H%M%S`
#备份
#docker commit -p $1 $1
#docker save  -o /opt/images/$1-$date_install.tar $1
#echo "已备份"
#运行新镜像
docker stop $1
docker rm $1 
docker rmi $1

