#!/bin/bash

docker stop mongodb
docker rm mongodb

# Build docker image
sh -c "docker build --rm -t browny/mongodb ."

# Run a docker container with the image
sh -c "docker run -d -t -i --name mongodb browny/mongodb"
#sh -c "docker run -d -t -i -p 27017:27017 -v $(pwd)/db:/data/db --name mongodb browny/mongodb"
