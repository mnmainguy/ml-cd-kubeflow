# AIOps - Machine Learning Continuous Delivery Pipeline Using Kubeflow and ArgoCD on AWS

## Overview
AIOps is an open source project that automates the setup of Kubeflow and ArgoCD for AWS EKS using Terraform. AIOps allows users to build a fully functional machine learning delivery pipeline with a few terraform commands. An example MNIST application is bundled in this project to demonstrate the pipeline workflow. It includes the following:

* VPC, public subnets, internet gateway, route tables and security groups
* 2 workspaces with autoscaling EKS clusters, EBS, and S3 instances (1 for training and 1 for production)
* Installation of Kubeflow on training and production EKS clusters
* Installation of Argo and ArgoCD on training EKS cluster
* Automated building of MNIST model docker image and deployment to training server using Argo and ArgoCD
* Automated export of trained model to s3 and automated serving of the model using Tensorflow serving

## Tech Stack
Technologies used: Teraform, Docker, Kubernetes, Ksonnet, Kubeflow, Argo, ArgoCD 
![alt text](https://user-images.githubusercontent.com/28720518/55841131-da1db700-5ae2-11e9-95e9-4c7ddb575ada.png)

## Required Tools
1. Terraform: https://learn.hashicorp.com/terraform/getting-started/install.html
2. AWS-CLI: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html
3. AWS-IAM: https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html
4. Kubectl: https://kubernetes.io/docs/tasks/tools/install-kubectl/
5. Ksonnet: https://github.com/ksonnet/ksonnet#install

## Required AWS Access
An AWS account is needed with the following permissions:
1. AmazonEC2FullAccess
2. AutoScalingFullAccess
3. AmazonS3FullAccess
4. AmazonEKSAdminPolicy: https://docs.aws.amazon.com/eks/latest/userguide/EKS_IAM_user_policies.html
5. IAMFullAccess

## Setup of AWS Infrastructure

```
# Clone repo
git clone https://github.com/mnmainguy/AIOps.git

# CD to terraform code directory
cd terraForm

# View and adjust terraform variables
# Note default EC2 instance is p2.xlarge which cost $0.09 per minute
vi terraform.tfvars

# Setup training workspace
terraform workspace new train

# Build terraform training workspace
terraform apply

# Setup training workspace
terraform workspace new prod

# Build terraform production workspace
terraform apply prod

# Setup Kubeconfig variable
export KUBECONFIG=$HOME/.kube/config-train:$HOME/.kube/config-prod
```

## Setup of Argocd:
```
# Switch kubectl context to training environment
kubectl config use-context aws-train

# Retrieve ArgoCD ELB hostname
kubectl get service -n argocd argocd-server 

# Retrieve ArgoCD default password - 
# The initial password is autogenerated to be the pod name of the Argo CD API server
kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2

# Login to Argo
# Username is admin; Password is displayed in the last command ran
argocd login <ARGOCD_SERVER>

# Change Password:
argocd account update-password

# Relogin
argo relogin

# Go to ArgoCD UI in web browser by navigating to <ARGOCD_SERVER> URL in browser, login with username and password

```
