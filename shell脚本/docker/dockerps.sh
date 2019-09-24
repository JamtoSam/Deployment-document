#/bin/bash
dockername=`docker ps | awk -F " " '{print $2}'`
for aname in $dockername
do
    for bname in eureka common robot websoket zuul manager job mail rpap-web  
    do
  	if [ "$aname" == "$bname" ];then
            echo $bname 
        fi
   done
done


