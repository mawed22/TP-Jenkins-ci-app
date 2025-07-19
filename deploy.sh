#!/bin/bash
IMAGE=$1

if [ -z "$IMAGE" ]; then
  echo "Usage: $0 <image_name>"
  exit 1
fi

docker pull "$IMAGE"
docker run -d -p 80:80 "$IMAGE"
