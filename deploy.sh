#!/bin/bash

# Variables
CONTAINER_NAME="my-container"
IMAGE_NAME="my-docker-image"
TAG="latest"
PORT=8080

# Stop and remove the old container if it exists
docker stop $CONTAINER_NAME 2>/dev/null || true
docker rm $CONTAINER_NAME 2>/dev/null || true

# Run new container
docker run -d -p $PORT:80 --name $CONTAINER_NAME $IMAGE_NAME:$TAG

echo "Container $CONTAINER_NAME running on port $PORT."
