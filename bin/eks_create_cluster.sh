#!/usr/bin/env bash

echo
echo "Creating cluster..."
aws configure set aws_access_key_id AKIAV54HP5HIANRZ2JP2
aws configure set aws_secret_access_key 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
aws configure set region us-east-1
aws sts get-caller-identity
./bin/eksctl create cluster -f cluster.yml

