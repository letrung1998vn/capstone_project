#!/usr/bin/env bash

echo
echo "Creating cluster..."
aws eks update-kubeconfig --region us-east-1 --name capstoneCluster -f hello_cluster.yml

