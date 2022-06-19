#!/usr/bin/env bash

echo
echo "Creating cluster..."
./bin/eksctl create cluster --config-file=hello_cluster.yml

