# project Outlook and workflow

- provisioing the myapp-server(jenkins) sitting on an EC2 instance created
- Accessibility to this Ec2 instance through port 8080 defined in SG
- the user me can only have access through SSH connection
- The provioning was done solely using terraform (IAC)

###  Workflow for this task using Terraform?
- VPC creation effected to start with
- Internet Gateway created while attaching it the VPC using a Route Table
- Public Subnet creation and associate it with the Route Table
- Security Group creation for firewall for the EC2 Instance
- Jenkins installation on the EC2 Instance done with script automation
- using an existing Key Pair to the Ec2 instance(myapp-server) created
- Making sure all works as specified


Deploy Netflix Clone on Cloud using Jenkins - DevSecOps Project!
Phase 1: Initial Setup and Deployment
Step 1: Launch EC2 (Ubuntu 22.04):

Provision an EC2 instance on AWS with Ubuntu 22.04.
Connect to the instance using SSH.
Step 2: Clone the Code:

Update all the packages and then clone the code.

Clone your application's code repository onto the EC2 instance:

https://github.com/clement2019/DevSecOps-Project.git
Step 3: Install Docker and Run the App Using a Container:

Set up Docker on the EC2 instance:



###  project Prerequisites
Installation and configuration of AWS CLI
Installation of Terraform


###  Run this to SSH into EC2
ssh -i devops_key2.pem amazon@public_ip

###  Use this to get the jenkins Admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

once jenkins is installed

###  Now change directory to infra from the project folder
cd infra
###  configure jenkins
install plugin node on jenkins
###  go to tools and add node inside node.js
now go to mamage jenkins
add credentials that the pipeline will use
### add Github credentials
username and password
Add Id:  GITHUB_CREDENTIALS
###  add dockerhub credentials
dockerhub id
dockkerhub username
dockerhubpassowrord as "secret test" in jenkins

add the name of kuberntestes cluster to deploy the application

### prequisite

1. first install the aws cli on my local machine
## install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
sudo apt install unzip 
unzip awscliv2.zip 
sudo ./aws/install

####check the version

aws --version
2. then create IAM user with adminAccess in AWS with  access key and secret key generated
Run aws configure
Authenticate with the command below
aws sts get-caller-identity
aws s3 ls

3. install kubectl on local machine and confirmed installation by running the command
### Install Kubernetes Kubectl:

    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    kubectl version 
kubectl version --client

4. ## install eksctl

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

sudo mv /tmp/eksctl /usr/local/bin

eksctl version

5. Create AWS EKS clsuster

## Pre-requisite links
https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html

6. #### Create EKS cluster
eksctl create cluster --name eks-cluster-201 --node-type t2.medium --nodes 2 --nodes-min 2 --nodes-max 3 --region eu-west-2

## Get cluster now
eksctl get cluster 

####update your cluster now
aws eks update-kubeconfig --name eks-cluster-201 --region eu-west-2

#### Get EKS Cluster service
eksctl get cluster --name eks-cluster-201 --region eu-west-2

#### Get EKS Pod data.
kubectl get pods --all-namespaces

#### Delete EKS cluster
eksctl delete cluster --name eks-cluster-201 --region eu-west-2
##or 
eksctl delete cluster --region=eu-west-2 --name=eks-cluster-201


####################################################################################################################
ONCE THE CLUSTER name eks-cluster-209 HAS BEEN CREATED WITH THE ABOVE CONMAND
  WE CAN THEN RUN THE JENKINS PIPELINE AND IT WILL BE REFERENCED IN TYHE PIPELINE SCRIPT

  
  
