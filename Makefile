
#Vars
CLUSTER_NAME=capstone-cluster
REGION_NAME=us-east-1
DEPLOYMENT_NAME=hello-world-app
CONTAINER_PORT=80
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

build-docker-v1:
	chmod +x ./bin/build_docker-v1.sh
	./bin/build_docker.sh

upload-docker:
	chmod +x ./bin/upload_docker-v1.sh
	./bin/upload_docker.sh

build-docker-v2:
	chmod +x ./bin/build_docker-v2.sh
	./bin/build_docker.sh

k8s-deployment:
	chmod +x ./bin/k8s_deployment.sh
	./bin/k8s_deployment.sh

rollout-status:
	aws eks --region us-east-1 update-kubeconfig --name capstone-cluster
	${KUBECTL} get svc
	${KUBECTL} rollout status deployment ${DEPLOYMENT_NAME}
	echo
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
