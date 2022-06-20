#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`
DOCKER_REPOSITORY="hello-world-app"
CONTAINER_NAME="letrung1998vn/hello-world-app"
VERSION="lastest"
DOCKER_USER="letrung1998vn"
DOCKER_PWD="socnhi.com1234"
# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=${DOCKER_USER}/${DOCKER_REPOSITORY}

# Step 2:
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login -u ${DOCKER_USER} -p ${DOCKER_PWD}
docker tag ${CONTAINER_NAME}:${VERSION} ${dockerpath}:${VERSION}

# Step 3:
# Push image to a docker repository
docker push ${dockerpath}:${VERSION}
