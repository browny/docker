#!/bin/bash

SOLR_VERSION=4.8.0
DOWNLOAD_PATH="http://apache.cdpa.nsysu.edu.tw/lucene/solr/4.8.0/solr-$SOLR_VERSION.tgz"

if [ ! -f ./file/solr-4.8.0.tgz ]
then
  echo "File not found"
  sh -c "wget $DOWNLOAD_PATH"
  sh -c "mkdir file; mv solr-$SOLR_VERSION.tgz file;"
fi 

# Build docker image
sh -c "docker build --rm -t solr ."

# Run a docker container with the image
sh -c "docker run -t -i -p 4096:22 -p 8081:8080 solr"
