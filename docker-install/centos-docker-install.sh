#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Update the package index
echo "Updating package index..."
sudo yum update -y

# Install required packages
echo "Installing required packages..."
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# Add Docker’s official repository
echo "Adding Docker’s official repository..."
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker Engine
echo "Installing Docker Engine..."
sudo yum install -y docker-ce docker-ce-cli containerd.io

# Start Docker
echo "Starting Docker..."
sudo systemctl start dockerd

# Enable Docker to start on boot
echo "Enabling Docker to start on boot..."
sudo systemctl enable dockerd

# Verify that Docker Engine is installed correctly by running the hello-world image
# echo "Verifying Docker Engine installation..."
# sudo docker run hello-world

echo "Docker has been installed successfully."