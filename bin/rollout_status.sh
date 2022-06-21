#!/usr/bin/env bash

#Vars
DEPLOYMENT_NAME=hello-world-app

# get kube config
aws eks --region us-east-1 update-kubeconfig --name capstone-cluster
kubectl get svc

# get rollout status of cluster
kubectl rollout status deployment ${DEPLOYMENT_NAME}
echo
kubectl get deployments -o wide
