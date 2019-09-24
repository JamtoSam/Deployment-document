#!/bin/bash
BUILD_ID=dontKillMe
export LANG="en_US.UTF-8"
locale
PROJECT_MODULE=brms-scheduler
microservice_dir=`echo /app/brms-scheduler/`
microservice_log=`echo /app/brms-scheduler/log/`
pid=`ps -ef|grep  ${microservice_dir}${PROJECT_MODULE}|grep -v grep |awk '{print $2}'`
ver=`echo "-1.0.0"`
  if [ -z "$pid"  ]
  then
  		echo 'restarting microservice:'${microservice_dir}${PROJECT_MODULE}${ver}.jar
  		nohup  java -Xms256m -Xmx256m -Xdebug -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=6006 -jar ${microservice_dir}${PROJECT_MODULE}${ver}.jar --spring.profiles.active=dev --server.port=6061 > ${microservice_log}log_${PROJECT_MODULE}.log 2>&1 &
  		sleep 20
  		pid21=`ps -ef|grep  $PROJECT_MODULE|grep -v grep |awk '{print $2}'`
  		if [ -z "$pid21"  ]
  		then
  			echo 'restarted microservice:'${microservice_dir}${PROJECT_MODULE}${ver}.jar' pid:'${pid21}'  fail!'
  		else
  			echo 'restarted microservice:'${microservice_dir}${PROJECT_MODULE}${ver}.jar' pid:'${pid21}'  success!'
  		fi
  else
  		echo 'killing and restarting  microservice:'${microservice_dir}${PROJECT_MODULE}${ver}.jar
  		kill -9 ${pid}
  		sleep 20
  		nohup  java -Xms256m -Xmx256m -Xdebug -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=6006 -jar ${microservice_dir}${PROJECT_MODULE}${ver}.jar --spring.profiles.active=dev --server.port=6061 > ${microservice_log}log_${PROJECT_MODULE}.log 2>&1 &
  		sleep 20
  		pid22=`ps -ef|grep  $PROJECT_MODULE|grep -v grep |awk '{print $2}'`
  		if [ -z "$pid22"  ]
  		then
  			echo 'killed and restarted microservice:'${microservice_dir}${PROJECT_MODULE}${ver}.jar' pid:'${pid22}'  fail!'
  		else
  			echo 'killed and restarted microservice:'${microservice_dir}${PROJECT_MODULE}${ver}.jar' pid:'${pid22}'  success!'
  		fi
  fi
