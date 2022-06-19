#!/usr/bin/env bash

echo
echo "Creating cluster..."
aws configure import --csv  file://new_user_credentials.csv
echo "get indentity"
aws configure list
aws configure list-profiles
aws configure
aws sts get-caller-identity
./bin/eksctl create cluster -f hello_cluster.yml

