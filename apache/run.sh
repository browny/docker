#!/bin/bash

# Build docker image
sh -c "docker build --rm -t apache ."

# Run a docker container with the image
sh -c "docker run -t -i -p 81:80 -p 23:22 apache"
