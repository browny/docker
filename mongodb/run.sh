#!/bin/bash

docker stop mongodb
docker rm mongodb

# Build docker image
sh -c "docker build --rm -t browny/mongodb ."

# Run a docker container with the image
#sh -c "docker run -d -t -i --name mongodb browny/mongodb"
sh -c "docker run -t -i -p 23:22 -p 27017:27017 -v /root/docker/mongodb/db:/usr/local/mongodb-data --name mongodb browny/mongodb"
