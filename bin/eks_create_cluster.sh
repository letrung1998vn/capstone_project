#!/usr/bin/env bash

echo
echo "Creating cluster..."
aws configure set aws_access_key_id AKIAV54HP5HIPYWRQDEO
aws configure set aws_secret_access_key 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
aws configure set region us-east-1
aws configure set default.ca_bundle /udapeople.pem
aws sts get-caller-identity
./bin/eksctl create cluster -f hello_cluster.yml

