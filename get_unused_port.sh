#!/bin/bash

docker_used_ports=($(netstat -tulpn | grep docker | awk '{print $4}' | sed 's/::://g'))
#for p in "${docker_used_ports[@]}"
#do
#  echo "${p} has been used"
#done

contains() {
  if [[ ${docker_used_ports[*]} =~ $1 ]]
    then
      echo 0 # continas
    else
      echo 1 # not contains
  fi
}

random_port() {
    random_port=$(shuf -i8081-8089 -n1)
    echo "$random_port"
}

port=$(random_port)
condition=$(contains $port)
while [ $condition -eq 0 ]
do
    port=$(random_port)
    condition=$(contains $port)
done

echo $port
