# Udacity AWS DevOps Capstone Project

## Project Overview

This capstone project showcases the use of several CI/CD tools and cloud services covered in the program [Udacity - AWS Cloud DevOps Engineer.](https://www.udacity.com/course/cloud-dev-ops-nanodegree--nd9991)

### Introduction

In this project I applied the skills and knowledge which were developed throughout the Cloud DevOps Nanodegree program. These include:
- Working in AWS
- Using Circle CI to implement Continuous Integration and Continuous Deployment
- Building pipelines
- Deploy cluster using eksctl and kubectls
- Building Docker containers in pipelines

# Explanations
1. `.circleci/config.yml`: for CircleCI configuration for pipelines
2. `app/app.py`: my main python application
3. `Makefile`: the Makefile use with CircleCI 
4. `bin`: the bin folder contain the shell script to create, install, build docker, create cluster, deploy 
5. `cluster.yml`: EKS cluster definition file
  
# For rolling Deveopment
I made two application, one in python-app folder as v1 app and one in python-app-update folder as v2 for demonstrating the rolling update.
I deployed the cluster with the v1 application in python-app folder first then updated the docker image with v2 application in python-app-update folder and did the rolling update.

All screenshots are attached in images folder.

The following shell scripts are invoked from the [Makefile](./Makefile)

* [eks_create_cluster.sh](./bin/eks_create_cluster.sh): creates the EKS cluster
* [install_eksctl.sh](./bin/install_eksctl.sh): installs the eksctl tool
* [install_hadolint.sh](./bin/install_hadolint.sh): installs the hadolint linter
* [install_kubectl.sh](./bin/install_kubectl.sh): installs the kubectl tool
* [install_shellcheck.sh](./bin/install_shellcheck.sh): installs the shellcheck(for shell scripts) linter tool
* [kubectl_delete.sh](./bin/kubectl_delete.sh): deletes services and deployments
* [kubectl_deploy.sh](./bin/kubectl_deploy.sh): deploys app into cluster
* [build_docker-v1.sh](./bin/build_docker-v1.sh): build docker image with v1 app
* [build_docker-v2.sh](./bin/build_docker-v1.sh): build docker image with v2 app
* [upload_docker.sh](./bin/upload_docker.sh): upload docker image to repository
* [eksctl_delete.sh](./bin/eksctl_delete.sh): delete cluster by eksctl