#!/bin/bash

# Deploy the framework using docker-compose
echo "Deploying the framework using docker-compose..."

# Check if docker-compose.yml exists
if [ -f "docker-compose.yml" ]; then
    echo "docker-compose.yml found. Starting deployment..."
    docker-compose up -d || {
        echo "Deployment failed. Please check your docker-compose configuration."
        exit 1
    }
else
    echo "docker-compose.yml not found!"
    exit 1
fi

echo "Deployment completed successfully!"
