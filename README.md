# Udacity AWS DevOps Engineer Capstone Project

## Project Overview

This capstone project showcases the use of several CI/CD tools and cloud services covered in the program [Udacity - AWS Cloud DevOps Engineer.](https://www.udacity.com/course/cloud-dev-ops-nanodegree--nd9991)

### Introduction

In this project I applied the skills and knowledge which were developed throughout the Cloud DevOps Nanodegree program. These include:
- Working in AWS
- Using Circle CI to implement Continuous Integration and Continuous Deployment
- Building pipelines
- Deploy cluster using eksctl and kubectl
- Building Docker containers in pipelines

### Project Tasks

Using a CI/CD approach, we build a [Docker](https://www.docker.com/resources/what-container) image and then run it in a [Kubernetes](https://kubernetes.io/) cluster.

The project includes the following main tasks:

* Initialize the Python virtual environment:  `make setup`
* Install all necessary dependencies:  `make install`
* Test the project's code using linting:  `make lint`
  * Lints shell scripts, Dockerfile and python code
* Create a Dockerfile to "containerize" the [hello](/hello_app/hello.py) application: [Dockerfile](hello_app/Dockerfile)
* Deploy to a public Docker Registry:
 [Docker Hub](https://hub.docker.com/repository/docker/letrung1998vn/hello-world-app) the containerized application
* Deploy a Kubernetes cluster:  `make eks-create-cluster`
* Deploy the application:  `make k8s-deployment`
* Update the app in the cluster, using a rolling-update strategy:  `make rolling-update`
* Delete the cluster:  `make eks-delete-cluster`
  
### Files

* [Makefile](./Makefile): the main file to execute all the project steps, i.e., the project's command center!
* [config.yml](.circleci/config.yml): to test and integrate the app under CircleCI
* [hello.app](./hello_app/hello.py): the sample python/flask app
* [Dockerfile](./hello_app/Dockerfile): the Docker image's specification file
* [hello_cluster.yml](./hello_cluster.yml): EKS cluster definition file

The following shell scripts are invoked from the [Makefile](./Makefile)

* [eks_create_cluster.sh](./bin/eks_create_cluster.sh): creates the EKS cluster
* [install_eksctl.sh](./bin/install_eksctl.sh): installs the eksctl tool
* [install_hadolint.sh](./bin/install_hadolint.sh): installs the hadolint linter(for Dockerfiles) tool
* [install_kubectl.sh](./bin/install_kubectl.sh): installs the kubectl tool to control K8S clusters
* [install_shellcheck.sh](./bin/install_shellcheck.sh): installs the shellcheck(for shell scripts) linter tool
* [k8s_cleanup_resources.sh](./bin/k8s_cleanup_resources.sh): deletes services and deployments in a K8S cluster
* [k8s_deployment.sh](./bin/k8s_deployment.sh): deploys and exposes a service in the K8S cluster
