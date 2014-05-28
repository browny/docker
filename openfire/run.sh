#!/bin/bash

# Ex: sh run.sh browny/openfire
# Usage: Access http://localhost:9090

DOCKER_IMAGE_NAME=$1

# Build docker image
sh -c "docker build -t $DOCKER_IMAGE_NAME ."

# Run a docker container with the image
sh -c "docker run -t -i -p 9090:9090 -p 9091:9091 -p 5222:5222 -p 5223:5223 $DOCKER_IMAGE_NAME"
