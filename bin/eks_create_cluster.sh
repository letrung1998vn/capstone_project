#!/usr/bin/env bash

echo
echo "Creating cluster..."
aws configure import --csv new_user_credentials.csv
./bin/eksctl create cluster --config-file=hello_cluster.yml

