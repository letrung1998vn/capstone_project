#!/usr/bin/env bash

OS=$(uname | tr "[:upper:]" "[:lower:]")
COMMAND="kubectl"

test -e ./bin/${COMMAND} ||
    {
        curl -sSLo ./bin/${COMMAND} "https://dl.k8s.io/release/$(curl -L -s \
            https://dl.k8s.io/release/stable.txt)/bin/${OS}/amd64/kubectl"
        chmod +x ./bin/${COMMAND}
    }
mv ./bin/kubectl /bin/kubectl
export PATH=/bin/kubectl:$PATH
echo "${COMMAND}: $(${COMMAND} version --client)"
