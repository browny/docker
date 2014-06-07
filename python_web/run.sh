#!/bin/bash

# Build docker image
sh -c "docker build --rm -t pyweb ."

# Run a docker container with the image
sh -c "docker run -t -i -p 5000:5000 -p 23:22 pyweb"
