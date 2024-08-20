#!/bin/bash

# Script to set up UFW and open necessary ports for SSH and Nginx Proxy Manager

echo "Starting UFW setup..."

# Update package lists
sudo apt-get update

# Install UFW if it's not already installed
sudo apt-get install -y ufw

# Allow SSH (port 22)
sudo ufw allow 22/tcp

# Allow HTTP (port 80)
sudo ufw allow 80/tcp

# Allow HTTPS (port 443)
sudo ufw allow 443/tcp

# Allow Nginx Proxy Manager Admin Panel (port 81)
sudo ufw allow 81/tcp

# Allow custom application ports
sudo ufw allow 3000/tcp
sudo ufw allow 3001/tcp
sudo ufw allow 4000/tcp
sudo ufw allow 4001/tcp

# Enable UFW
sudo ufw --force enable

# Set default policies to deny all incoming connections except allowed ones
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Reload UFW to apply all changes
sudo ufw reload

# Display UFW status to verify the rules
sudo ufw status verbose

echo "UFW setup complete. All necessary ports are now open."
