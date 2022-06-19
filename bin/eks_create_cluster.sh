#!/usr/bin/env bash

echo
echo "Creating cluster..."
aws configure import --csv  file://new_user_credentials.csv
aws configure set region us-east-1 --profile new_user_credentials
./bin/eksctl create cluster --config-file=hello_cluster.yml

