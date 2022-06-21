#!/usr/bin/env bash

echo
echo "Creating cluster..."
aws configure set aws_access_key_id AKIASPJPHRDZWOII2ZFL
aws configure set aws_secret_access_key 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
aws configure set region us-east-1
aws sts get-caller-identity
aws eks --region us-east-1 update-kubeconfig --name capstone-cluster
kubectl get svc
./bin/eksctl upgrade cluster -f cluster.yml

