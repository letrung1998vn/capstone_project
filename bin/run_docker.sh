#!/usr/bin/env bash

CONTAINER_NAME="letrung1998vn/hello-app"
VERSION=1.000
CONTAINER_PORT=80
HOST_PORT=80
# Run flask app
docker run -p ${HOST_PORT}:${CONTAINER_PORT} ${CONTAINER_NAME}:${VERSION}
