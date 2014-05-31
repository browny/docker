
#!/bin/bash

TAG_NAME=$1

short_id=$(docker ps | grep $TAG_NAME | awk '{print $1}')
echo $short_id

container_id=$(docker inspect $(docker ps | grep $TAG_NAME | awk '{print $1}') | grep \"ID\" |  sed -E "s/(\"ID\": \")([a-z0-9]*)\",/\\2/" | tr -d ' ')
echo $container_id

log_path="/var/lib/docker/containers/$container_id/root/var/lib/tomcat6/logs"
echo $log_path

cd $log_path
