#!/usr/bin/env bash

CONTAINER_NAME="letrung1998vn/hello-world-app"
VERSION=lastest
App Name=python-app

# Step 1:
# Build image and add a descriptive tag
docker build --tag ${CONTAINER_NAME}:${VERSION} python-app
