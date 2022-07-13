#!/bin/bash

#Generamos un pre-share-key para acceder a los servidores en Azure
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<< y

# Iniciamos terraform
terraform -chdir=terraform init

#Creamos un plan
terraform -chdir=terraform plan -out=myplan

#Corremos el plan
terraform -chdir=terraform apply "myplan"

# Corremos el resource que genera el archivo hosts para ansible
terraform -chdir=terraform apply -auto-approve -target=local_file.tf_ansible_vars_file_new

#Desactivamos hostkey checking para evitar interacciones manuales con los servidores
export ANSIBLE_HOST_KEY_CHECKING=False

#Movemos automaticamente el archivo hosts al directorio de ansible
mv -f terraform/hosts ansible/hosts

# Ejecutamos el playbook de Kubernetes
ansible-playbook -i ansible/hosts ansible/implementacion-kubernetes.yml

# Ejecutamos el playbook de la aplicación
ansible-playbook -i ansible/hosts ansible/implementacion-aplicacion.yml

