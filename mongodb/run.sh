#!/bin/bash

docker stop mongodb
docker rm mongodb

# Build docker image
sh -c "docker build --rm -t mongodb_image ."

# Run a docker container with the image
sh -c "docker run -t -i -p 23:22 -p 27017:27017 -v /root/docker/mongodb/db:/data/db/ --name mongodb mongodb_image"
