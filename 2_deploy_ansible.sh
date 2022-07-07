#!/bin/bash

# Ejecutamos el playbook de Kubernetes
ansible-playbook -i ansible/hosts ansible/implementacion-kubernetes.yml

# Ejecutamos el playbook de la aplicación
ansible-playbook -i ansible/hosts ansible/implementacion-aplicacion.yml
