#!/usr/bin/env bash

echo
echo "Creating cluster..."
aws configure set aws_access_key_id AKIAV54HP5HIKUKJA7NC
aws configure set aws_secret_access_key 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
aws configure set region us-east-1
aws sts get-caller-identity
aws eks --region us-east-1 update-kubeconfig --name capstone-cluster
kubectl get svc
./bin/eksctl create cluster -f cluster.yml

