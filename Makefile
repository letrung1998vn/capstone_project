## The Makefile includes instructions on: 
# environment setup, install, lint and build

#Vars
CLUSTER_NAME=capstone-cluster
REGION_NAME=us-east-1
KEYPAIR_NAME=udapeople
DEPLOYMENT_NAME=hello-world-app
NEW_IMAGE_NAME=letrung1998vn/hello-world-app:latest
CONTAINER_PORT=80
HOST_PORT=80
KUBECTL=./bin/kubectl

install:

	echo "Installing: dependencies..."
	pip install --upgrade pip &&\
	pip install -r hello_app/requirements.txt
	echo
	pytest --version
	echo
	echo "Installing: shellcheck"
	chmod +x ./bin/install_shellcheck.sh
	./bin/install_shellcheck.sh
	echo
	echo "Installing: hadolint"
	chmod +x ./bin/install_hadolint.sh
	./bin/install_hadolint.sh
	echo
	echo "Installing: kubectl"
	chmod +x ./bin/install_kubectl.sh
	./bin/install_kubectl.sh
	echo
	echo "Installing: eksctl"
	chmod +x ./bin/install_eksctl.sh
	./bin/install_eksctl.sh

lint:
	# https://github.com/koalaman/shellcheck: a linter for shell scripts
	./bin/shellcheck -Cauto -a ./bin/*.sh
	# https://github.com/hadolint/hadolint: a linter for Dockerfiles
	./bin/hadolint hello_app/Dockerfile
	# https://www.pylint.org/: a linter for Python source code 
	# This should be run from inside a virtualenv
	pylint --output-format=colorized --disable=C hello_app/hello.py

build-docker:
	chmod +x ./bin/build_docker.sh
	./bin/build_docker.sh

upload-docker: build-docker
	chmod +x ./bin/upload_docker.sh
	./bin/upload_docker.sh

ci-validate:
	# Required file: .circleci/config.yml
	circleci config validate

k8s-deployment: eks-create-cluster
	# If using minikube, first run: minikube start
	chmod +x ./bin/k8s_deployment.sh
	./bin/k8s_deployment.sh

port-forwarding: 
	# Needed for "minikube" only
	${KUBECTL} port-forward pod/${DEPLOYMENT_NAME} --address ${HOST_PORT}:${CONTAINER_PORT}

rolling-update:
	${KUBECTL} get deployments -o wide
	${KUBECTL} set image deployments/${DEPLOYMENT_NAME} \
		${DEPLOYMENT_NAME}=${NEW_IMAGE_NAME}
	echo
	${KUBECTL} get deployments -o wide
	${KUBECTL} describe pods | grep -i image
	${KUBECTL} get pods -o wide

rollout-status:
	${KUBECTL} rollout status deployment ${DEPLOYMENT_NAME}
	echo
	${KUBECTL} get deployments -o wide

rollback:
	${KUBECTL} get deployments -o wide
	${KUBECTL} rollout undo deployment ${DEPLOYMENT_NAME}
	${KUBECTL} describe pods | grep -i image
	echo
	${KUBECTL} get pods -o wide
	${KUBECTL} get deployments -o wide

k8s-cleanup-resources:
	chmod +x ./bin/k8s_cleanup_resources.sh
	./bin/k8s_cleanup_resources.sh

eks-create-cluster:
	chmod +x ./bin/eks_create_cluster.sh
	./bin/eks_create_cluster.sh

eks-delete-cluster:
	./bin/eksctl delete cluster --name "${CLUSTER_NAME}" \
		--region "${REGION_NAME}"
