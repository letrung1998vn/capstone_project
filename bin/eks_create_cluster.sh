#!/usr/bin/env bash

echo
echo "Creating cluster..."
aws configure set aws_access_key_id AKIAV54HP5HIC4PVJH42
aws configure set aws_secret_access_key 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
aws configure set region us-east-1
aws sts get-caller-identity
aws eks --region us-east-1 update-kubeconfig --name capstone-cluster
kubectl get svc
./bin/eksctl create cluster -f cluster.yml

