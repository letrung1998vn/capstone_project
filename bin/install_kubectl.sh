#!/usr/bin/env bash

OS=$(uname | tr "[:upper:]" "[:lower:]")
COMMAND="kubectl"

test -e ./bin/${COMMAND} ||
    {
        curl -sSLo ${COMMAND} "https://dl.k8s.io/release/$(curl -L -s \
            https://dl.k8s.io/release/stable.txt)/bin/${OS}/amd64/kubectl"
        chmod +x ${COMMAND}
    }

echo "${COMMAND}: $(${COMMAND} version --client)"
