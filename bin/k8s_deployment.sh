#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Set vars
DOCKER_HUB_ID="registry.hub.docker.com/letrung1998vn"
DOCKER_REPOSITORY="hello-app"
DEPLOYMENT_NAME=${DOCKER_REPOSITORY}
CONTAINER_PORT=80
VERSION=1.000
REPLICAS=4

dockerpath=${DOCKER_HUB_ID}/${DOCKER_REPOSITORY}:${VERSION}

# Run the Docker Hub container with kubernetes
./bin/kubectl create deployment ${DEPLOYMENT_NAME} --image=${dockerpath} --replicas=${REPLICAS} &&
    ./bin/kubectl expose deployment/${DEPLOYMENT_NAME} --type="LoadBalancer" --port ${CONTAINER_PORT}

# List kubernetes resources
echo
echo "Listing deployments"
./bin/kubectl get deployments -o wide
echo
echo "Listing services"
./bin/kubectl get services -o wide
echo
echo "Listing pods"
./bin/kubectl get pods -o wide

