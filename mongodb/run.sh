#!/bin/bash

# Build docker image
sh -c "docker build --rm -t mongodb ."

# Run a docker container with the image
sh -c "docker run -t -i -p 23:22 -p 27017:27017 mongodb"
