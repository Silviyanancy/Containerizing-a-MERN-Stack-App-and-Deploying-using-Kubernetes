#!/bin/bash

# Set Docker Hub username
DOCKER_USERNAME="nancysilviya"

# Define image names and tags
BACKEND_IMAGE="mern_app-backend"
FRONTEND_IMAGE="mern_app-frontend"

# Fetch the latest image IDs
BACKEND_IMAGE_ID=$(docker images -q ${BACKEND_IMAGE})
FRONTEND_IMAGE_ID=$(docker images -q ${FRONTEND_IMAGE})

# Check if images exist
if [ -z "$BACKEND_IMAGE_ID" ]; then
    echo "Backend image not found. Build it first using 'docker-compose build'."
    exit 1
fi

if [ -z "$FRONTEND_IMAGE_ID" ]; then
    echo "Frontend image not found. Build it first using 'docker-compose build'."
    exit 1
fi

# Tag the backend image
echo "Tagging backend image..."
docker tag $BACKEND_IMAGE_ID $DOCKER_USERNAME/$BACKEND_IMAGE:latest

# Tag the frontend image
echo "Tagging frontend image..."
docker tag $FRONTEND_IMAGE_ID $DOCKER_USERNAME/$FRONTEND_IMAGE:latest

# Push the backend image
echo "Pushing backend image to Docker Hub..."
docker push $DOCKER_USERNAME/$BACKEND_IMAGE:latest

# Push the frontend image
echo "Pushing frontend image to Docker Hub..."
docker push $DOCKER_USERNAME/$FRONTEND_IMAGE:latest

echo "Docker images pushed successfully!"
