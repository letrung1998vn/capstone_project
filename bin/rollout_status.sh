#!/usr/bin/env bash

#Vars
DEPLOYMENT_NAME="hello-world-app"
DOCKER_HUB_ID="letrung1998vn"
DOCKER_REPOSITORY="hello-world-app"
DEPLOYMENT_NAME=${DOCKER_REPOSITORY}
VERSION=lastest
dockerpath=${DOCKER_HUB_ID}/${DOCKER_REPOSITORY}:${VERSION}
# get kube config
aws eks --region us-east-1 update-kubeconfig --name capstone-cluster
kubectl get svc

# get rollout status of cluster
kubectl patch deployment ${DEPLOYMENT_NAME} -p "{\"spec\":{\"template\":{\"spec\":{\"containers\":[{\"name\":\"${DOCKER_REPOSITORY}\",\"image\":\"${dockerpath}\",\"imagePullPolicy\": \"Always\"}]}}}}"
kubectl rollout status deployment ${DEPLOYMENT_NAME}
echo
kubectl get deployments -o wide
