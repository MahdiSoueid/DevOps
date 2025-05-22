# Docker Setup with Ansible

This directory contains Ansible playbooks to set up Docker and Docker Compose on your Linux server.

## Prerequisites

1. Ansible installed on your local machine
2. SSH access to your target server
3. SSH key pair for authentication

To access the server for the file
ssh  'echo "your-sudo-password" | sudo -S bash -s' < script.sh

## Configuration

1. Edit the `inventory.ini` file and replace the following placeholders:
   - `YOUR_SERVER_IP`: Your server's IP address
   - `YOUR_USERNAME`: Your SSH username
   - Update the SSH key path if different from `~/.ssh/id_rsa`

## Usage

1. Test the connection to your server:
   ```bash
   ansible all -i inventory.ini -m ping
   ```

2. Run the Docker setup playbook:
   ```bash
   ansible-playbook -i inventory.ini setup_docker.yml
   ```

## What the Playbook Does

The playbook will:
1. Update the system packages
2. Install required dependencies
3. Add Docker's official GPG key and repository
4. Install Docker and Docker Compose
5. Configure Docker to start on boot
6. Add your user to the docker group

## Verification

After the playbook completes, you can verify the installation by:
1. SSH into your server
2. Run `docker --version`
3. Run `docker-compose --version`
4. Try running a test container: `docker run hello-world` 