#!/bin/bash

# Usage: sh run.sh [WAR_NAME] [MAPPED_HOST_PORT] [DOCKER_IMAGE_NAME]
# Ex: sh run.sh test 8081 test

WAR_FILE_SUFFIX=".war"

WAR_NAME=$1
MAPPED_HOST_PORT=$2
DOCKER_IMAGE_NAME=$3

WAR_FILE=$1$WAR_FILE_SUFFIX

# Get the war file
mkdir -p ./war
cp /tmp/$WAR_FILE ./war/

# Compile the Dockerfile
sh -c "sed -r 's/WAR_FILE/$WAR_FILE/' Dockerfile.template > Dockerfile"

# Build docker image
sh -c "docker build -t $DOCKER_IMAGE_NAME ."

# Run a docker container with the image
sh -c "docker run -t -i -p $MAPPED_HOST_PORT:8080 $DOCKER_IMAGE_NAME"
