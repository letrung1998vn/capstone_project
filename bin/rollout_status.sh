#!/usr/bin/env bash

#Vars
DEPLOYMENT_NAME=hello-world-app
KUBECTL=./bin/kubectl

# get kube config
aws eks --region us-east-1 update-kubeconfig --name capstone-cluster
s get svc

# get rollout status of cluster
${KUBECTL} rollout status deployment ${DEPLOYMENT_NAME}
echo
${KUBECTL} get deployments -o wide
