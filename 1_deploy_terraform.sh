#!/bin/bash

terraform -chdir=terraform init
terraform -chdir=terraform plan -out=myplan
terraform -chdir=terraform apply "myplan"
