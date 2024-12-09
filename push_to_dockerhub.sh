#!/bin/bash

DOCKER_USERNAME="nancysilviya"

# Build backend and frontend images
echo "Building Docker images..."
docker-compose build

# Tag and push backend image
echo "Tagging and pushing backend image..."
docker tag mern_app-backend:latest $DOCKER_USERNAME/mern_app-backend:latest
docker push $DOCKER_USERNAME/mern_app-backend:latest

# Tag and push frontend image
echo "Tagging and pushing frontend image..."
docker tag mern_app-frontend:latest $DOCKER_USERNAME/mern_app-frontend:latest
docker push $DOCKER_USERNAME/mern_app-frontend:latest

echo "Docker images pushed successfully!"
