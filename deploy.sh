#!/bin/bash
IMAGE=$1
CONTAINER_NAME=web

# Stop previous container
sudo docker rm -f $CONTAINER_NAME 2>/dev/null

# Pull and run
sudo docker pull $IMAGE
sudo docker run -d --name $CONTAINER_NAME -p 80:80 $IMAGE