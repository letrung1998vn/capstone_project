#!/usr/bin/env bash

echo
echo "Creating cluster..."
aws eks update-kubeconfig -f hello_cluster.yml

