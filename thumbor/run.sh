#!/bin/bash

# Build docker image
sh -c "docker build --rm -t thumbor ."

# Run a docker container with the image
sh -c "docker run -t -i -p 8888:8888 thumbor"
