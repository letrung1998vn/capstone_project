#!/usr/bin/env bash

CONTAINER_NAME="letrung1998vn/hello-app"
VERSION=1.000
CONTAINER_PORT=80
HOST_PORT=80
DOCKER_USER="letrung1998vn"
DOCKER_PWD="socnhi.com1234"
# Login Docker
docker login -u ${DOCKER_USER} -p ${DOCKER_PWD}
# Run flask app
docker run -t --rm -p ${HOST_PORT}:${CONTAINER_PORT} ${CONTAINER_NAME}:${VERSION}
