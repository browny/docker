#!/bin/bash

# Build docker image
sh -c "docker build -t redis ."

# Run a docker container with the image
sh -c "docker run -i -t -p 6379:6379 redis"
