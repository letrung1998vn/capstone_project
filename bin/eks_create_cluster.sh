#!/usr/bin/env bash

echo
echo "Creating cluster..."
./bin/eksctl create cluster -f hello_cluster.yml

