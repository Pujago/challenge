# challenge

# Creating Azure Infrastructure

Resources are for Azure Cloud
Prequisites required:
1. Install Terrform on the machine
2. Install Azure CLI

To login to azure: 
Use Commands:

az login

Note: If you have multiple subscription, set one using command below: \
az account set --subscription="<use your subscription id>"

# Code structure
Below are the folders in the repository challenge \
main: contains all code to call modules/create resources \
tvar - var files for each environment - here it is only dev.tfvars \
modules folder has re-usable modules for terraform \
all others are terraform config files \

# To deploy

- Open dev.tfvar file
* Change the name of resources as per your need

- Go to the folder terraform
* Run these commands

# Terraform Init
Terraform init

# Terraform Validate
Terraform validate

# Plan
terraform plan -out="tfvars/tfplan-dev" -var-file="tfvars/dev.tfvars"

# Apply
terraform apply "environment/tfplan-dev"


##################################
# Next step
##################################


# Tasks not done yet
1. Create postgres database inside vm
2. Build docker image
3. Push image to docker hub
4. Install Docker in VM
5. Pull image from docker hub
6. Run the image as container


### Issue: Not able to build the docker file to create docker image


PS C:\development\TechChallengeApp> docker build -t leogether/techchallengelab .
[+] Building 3.0s (14/22)
 => [internal] load build definition from Dockerfile                                                                                                0.0s 
 => => transferring dockerfile: 32B                                                                                                                 0.0s 
 => [internal] load .dockerignore                                                                                                                   0.0s 
 => => transferring context: 34B                                                                                                                    0.0s 
 => [internal] load metadata for docker.io/library/alpine:latest                                                                                    2.5s 
 => [internal] load metadata for docker.io/library/golang:alpine                                                                                    2.6s 
 => [auth] library/alpine:pull token for registry-1.docker.io                                                                                       0.0s 
 => [auth] library/golang:pull token for registry-1.docker.io                                                                                       0.0s 
 => [stage-1 1/4] FROM docker.io/library/alpine:latest@sha256:d6d0a0eb4d40ef96f2310ead734848b9c819bb97c9d846385c4aca1767186cd4                      0.0s 
 => [build  1/11] FROM docker.io/library/golang:alpine@sha256:ec3acb156c891fe0aadd20ce4bec20808b2d53414b5f73e631698d0fab6b8d28                      0.0s 
 => [internal] load build context                                                                                                                   0.0s 
 => => transferring context: 1.92kB                                                                                                                 0.0s 
 => CACHED [build  2/11] RUN apk add --no-cache curl git alpine-sdk                                                                                 0.0s 
 => CACHED [build  3/11] RUN dir=$(mktemp -d)     && git clone https://github.com/go-swagger/go-swagger "$dir"     && cd "$dir"     && go install   0.0s 
 => ERROR [build  4/11] RUN go get github.com/GeertJohan/go.rice/rice                                                                               0.4s 
 => CACHED [stage-1 2/4] WORKDIR /TechChallengeApp                                                                                                  0.0s 
 => CACHED [stage-1 3/4] COPY conf.toml ./conf.toml                                                                                                 0.0s 
------
 > [build  4/11] RUN go get github.com/GeertJohan/go.rice/rice:
#14 0.380 go: go.mod file not found in current directory or any parent directory.
#14 0.380       'go get' is no longer supported outside a module.
#14 0.380       To build and install a command, use 'go install' with a version,
#14 0.380       like 'go install example.com/cmd@latest'
#14 0.380       For more information, see https://golang.org/doc/go-get-install-deprecation
#14 0.380       or run 'go help get' or 'go help install'.
------
executor failed running [/bin/sh -c go get github.com/GeertJohan/go.rice/rice]: exit code: 1
