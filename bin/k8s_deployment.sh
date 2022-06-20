#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Set vars
DOCKER_HUB_ID="letrung1998vn"
DOCKER_REPOSITORY="hello-world-app"
DEPLOYMENT_NAME=${DOCKER_REPOSITORY}
CONTAINER_PORT=80
VERSION=1.000

dockerpath=${DOCKER_HUB_ID}/${DOCKER_REPOSITORY}:${VERSION}

# set aws configure
aws configure set aws_access_key_id AKIAV54HP5HIPYWRQDEO
aws configure set aws_secret_access_key 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
aws configure set region us-east-1
aws sts get-caller-identity
# Create config file
echo "Create config"
aws eks --region us-east-1 update-kubeconfig --name capstone-cluster
./bin/kubectl get svc
# Run the Docker Hub container with kubernetes
echo "Create deployment"
# ./bin/kubectl create --namespace kube-system -f /root/.kube/config
# ./bin/kubectl apply -f /root/.kube/config
./bin/kubectl create deployment ${DEPLOYMENT_NAME} --image=${dockerpath}
# ./bin/kubectl edit deployment ${DEPLOYMENT_NAME}
./bin/kubectl expose deployment/${DEPLOYMENT_NAME} --type="LoadBalancer" --port ${CONTAINER_PORT}
# List kubernetes resources
echo
echo "Listing deployments"
./bin/kubectl get deployments -o wide --all-namespaces
echo
echo "Listing services"
./bin/kubectl get services -o wide --all-namespaces
echo
echo "Listing pods"
./bin/kubectl get pods -o wide --all-namespaces
./bin/kubectl get nodes -o wide --all-namespaces

