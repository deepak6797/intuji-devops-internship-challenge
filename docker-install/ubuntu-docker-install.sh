#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# First, update your existing list of packages
echo "Updating packages ...."
sudo apt-get update -y

# Install necessary packages
echo "Installing packages to allow apt to use a repository over HTTPS..."
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add the GPG key for the official Docker repository to your system
echo "Adding Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable repository / Add the Docker repository to APT sources
echo "Setting up the Docker stable repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index again
echo "Updating package again ..."
sudo apt-get update

# Install the latest version of Docker Engine, Docker CLI, and containerd
echo "Installing Docker Engine..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Start Docker
echo "Starting Docker..."
sudo systemctl start docker

# Enable Docker to start on boot
echo "Enabling Docker to start on boot..."
sudo systemctl enable docker

# Verify that Docker Engine is installed correctly by running the hello-world image
# echo "Verifying Docker Engine installation..."
# sudo docker run hello-world

echo "Docker has been installed successfully."