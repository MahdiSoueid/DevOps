#!/bin/bash

# Check if Ansible is installed
if ! command -v ansible &> /dev/null; then
    echo "Ansible is not installed. Installing Ansible..."
    sudo apt-get update
    sudo apt-get install -y software-properties-common
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt-get install -y ansible
else
    echo "Ansible is already installed"
fi

# Clone the repository
echo "Cloning the repository..."
git clone https://github.com/MahdiSoueid/DevOps.git
cd springboot-postgres-demo

# Run the Ansible playbook
echo "Running Ansible playbook..."
ansible-playbook -i inventory.ini setup_docker.yml