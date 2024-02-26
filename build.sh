#!/bin/bash

# docker login before running the script

IMAGE_NAME="kennedydocker/resume-nginx"
# Generate a random version string using date and a random number
VERSION=$(date +%Y%m%d)-$(head -c 6 /dev/urandom | base64 | tr -dc 'a-zA-Z0-9')
DOCKER_IMAGE="$IMAGE_NAME:$VERSION"

# Building the Docker image
echo "Building Docker image $DOCKER_IMAGE..."
docker build -t "$DOCKER_IMAGE" .

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Docker image built successfully."
else
    echo "Error building Docker image."
    exit 1
fi

# Pushing the Docker image
echo "Pushing Docker image..."
docker push "$DOCKER_IMAGE"

# Output the version
echo "Image version: $VERSION"
echo "Image full path: $DOCKER_IMAGE"

# # Git 
# git add .
# git commit -m "Update image version to $VERSION"
# git push origin main