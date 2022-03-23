# challenge

# Creating Azure Infrastructure

Resources are for Azure Cloud
Prequisites required:
1. Install Terrform on the machine
2. Install Azure CLI

To login to azure: 
Use Commands:

az login

Note: If you have multiple subscription, set one using command below:
az account set --subscription="<use your subscription id>"

# Code structure
Below are the folders in the repository challenge
main: contains all code to call modules/create resources
tvar - var files for each environment - here it is only dev.tfvars
modules folder has re-usable modules for terraform
all others are terraform config files

# To deploy

Open dev.tfvar file
Change the name of resources as per your need

Go to the folder terraform
Run these commands

Terraform init
Terraform validate

# Plan
terraform plan -out="tfvars/tfplan-dev" -var-file="tfvars/dev.tfvars"

# Apply
terraform apply "environment/tfplan-dev"


##################################
# Next step
##################################


# To Do
Create postgres database
Build docker image
Push image to docker hub
Install Docker in VM
Pull image from docker hub
Run the image as container

