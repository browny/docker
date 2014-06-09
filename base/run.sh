#!/bin/bash

# Build docker image
sh -c "docker build --rm -t base ."

# Run a docker container with the image
sh -c "docker run -t -i -p 2022:22 base"
