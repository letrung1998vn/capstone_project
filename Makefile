setup:
	# Create python venv and source it
	# python3 -m venv ~/.final-project
	# source ~/.final-project/bin/active

install:
	echo "Installing: dependencies..."
	pip install --upgrade pip &&\
	pip install -r requirements.txt
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
	./bin/shellcheck -Cauto -a ./bin/*.sh
	./bin/hadolint python-app/Dockerfile
	./bin/hadolint python-app-update/Dockerfile
	pylint --disable=R,C,W1203,W1202 python-app/app.py
	pylint --disable=R,C,W1203,W1202 python-app-update/app.py

build-docker-v1:
	chmod +x ./bin/build_docker-v1.sh
	./bin/build_docker-v1.sh

upload-docker:
	chmod +x ./bin/upload_docker.sh
	./bin/upload_docker.sh

build-docker-v2:
	chmod +x ./bin/build_docker-v2.sh
	./bin/build_docker-v2.sh

cluster-deployment:
	chmod +x ./bin/kubectl_deploy.sh
	./bin/kubectl_deploy.sh

cluster-deployment-rolling-update:
	chmod +x ./bin/kubectl_deploy_rolling.sh
	./bin/kubectl_deploy_rolling.sh

rollout-status:
	chmod +x ./bin/rollout_status.sh
	./bin/rollout_status.sh

cluster-cleanup:
	chmod +x ./bin/kubectl_delete.sh
	./bin/kubectl_delete.sh

eks-create-cluster:
	chmod +x ./bin/eks_create_cluster.sh
	./bin/eks_create_cluster.sh

eks-delete-cluster:
	chmod +x ./bin/eksctl_delete.sh
	./bin/eksctl_delete.sh
