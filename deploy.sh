#!/bin/bash
IMAGE=$1
CONTAINER_NAME=web

# Stop previous container
docker rm -f $CONTAINER_NAME

# Pull and run
docker pull $IMAGE
docker run -d --name $CONTAINER_NAME -p 80:80 $IMAGE