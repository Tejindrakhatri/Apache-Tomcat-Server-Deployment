#!/bin/bash

# Deploy Apache Tomcat using Terraform
terraform init
terraform apply -auto-approve

# Get the public IP of the EC2 instance
PUBLIC_IP=$(terraform output public_ip)

# Run Ansible playbook to install and configure Tomcat
ansible-playbook -i "${PUBLIC_IP}," -u ubuntu --private-key your_key.pem install_tomcat.yml

