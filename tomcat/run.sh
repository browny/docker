#!/bin/bash

# Usage: sh run.sh [WAR_NAME] [MAPPED_HOST_PORT] [DOCKER_IMAGE_NAME]
# Ex: sh run.sh test.war 8080 test

WAR_FILE=$1
MAPPED_HOST_PORT=$2
DOCKER_IMAGE_NAME=$3

# Get the war file
mkdir -p ./war
cp $(pwd)/$WAR_FILE ./war/

# Compile the Dockerfile
#sh -c "sed -r 's/WAR_FILE/$WAR_FILE/' Dockerfile.template > Dockerfile"
# For MacOSX
sh -c "sed -E 's/WAR_FILE/$WAR_FILE/' Dockerfile.template > Dockerfile"

# Build docker image
sh -c "docker build --rm -t $DOCKER_IMAGE_NAME ."

# Run a docker container with the image
sh -c "docker run -t -i -p $MAPPED_HOST_PORT:8080 $DOCKER_IMAGE_NAME"
