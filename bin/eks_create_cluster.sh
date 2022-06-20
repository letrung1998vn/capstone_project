#!/usr/bin/env bash

echo
echo "Creating cluster..."
aws configure set aws_access_key_id AKIAV54HP5HIEN2NXHXV
aws configure set aws_secret_access_key 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
aws configure set region us-east-1
aws sts get-caller-identity
./bin/eksctl create cluster -f cluster.yml

