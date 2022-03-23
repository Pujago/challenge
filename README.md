# challenge

##################################
# Creating Azure Infrastructure
##################################

# Resources are for Azure Cloud
# Prequisites required:
# Install Terrform on the machine
# Install Azure CLI
#
# To login to azure: 
# Use Commands:
# az login

# If you have multiple subscription
# az account set --subscription="<use your subscription id>"

# Code structure
# Below are the folders in the repository challenge
# main: contains all code to call modules/create resources
# modules folder has re-usable modules for terraform
# all others are terraform config files


# To deploy
# Go to the folder terraform
# Run these commands


# tvar - var files for each environment - here it is only dev.tfvars
Open dev.tfvar file
Change the name of resources as per your need

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


To do yet:
Build docker image
Push image to docker hub
Install Docker in VM
Pull image from docker hub

