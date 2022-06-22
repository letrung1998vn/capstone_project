#!/usr/bin/env bash

#Vars
CLUSTER_NAME="capstone-cluster"
REGION_NAME="us-east-1"

# Delete Cluster
./bin/eksctl delete cluster --name "${CLUSTER_NAME}" --region "${REGION_NAME}"
