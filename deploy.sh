#!/bin/bash
IMAGE=$1
#CONTAINER_NAME=Test

# Stop previous container
#docker rm -f $CONTAINER_NAME

# Pull and run
docker pull $IMAGE
#docker run -d --name $CONTAINER_NAME -p 80:80 $IMAGE
docker run -d -p 80:80 $IMAGE