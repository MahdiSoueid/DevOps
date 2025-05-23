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
cd DevOps

# Create inventory file for local execution
echo "[local]
localhost ansible_connection=local" > ansible/inventory.ini

# Run the Ansible playbook
echo "Running Ansible playbook..."
cd ansible
ansible-playbook -i inventory.ini setup_docker.yml

# Return to the main directory
cd ..

# Wait for Docker to be ready
echo "Waiting for Docker to be ready..."
sleep 5

# Run Docker Compose
echo "Starting the application with Docker Compose..."
docker compose up -d

# Show the status of the containers
echo "Container status:"
docker compose ps

# Show the logs
echo "Application logs:"
docker compose logs -f