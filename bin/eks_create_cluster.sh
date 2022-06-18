#!/usr/bin/env bash

CLUSTER="hello"
REGION="us-east-1"
CLUSTER_NAME="${CLUSTER}.${REGION}.eksctl.io"

echo
echo "Creating cluster..."
./bin/eksctl create cluster -f hello_cluster.yml

