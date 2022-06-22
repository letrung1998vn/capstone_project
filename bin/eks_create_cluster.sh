#!/usr/bin/env bash

echo
echo "Creating cluster..."
aws configure set aws_access_key_id AKIASPJPHRDZW7MGKX3C
aws configure set aws_secret_access_key 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
aws configure set region us-east-1
aws sts get-caller-identity
./bin/eksctl create cluster -f cluster.yml

