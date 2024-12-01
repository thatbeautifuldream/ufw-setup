#!/bin/bash

# Script to set up UFW and manage necessary ports

echo "Starting UFW setup..."

# Update package lists
sudo apt-get update

# Check if UFW is installed, install it if not
if ! command -v ufw &> /dev/null; then
    echo "UFW not found. Installing..."
    sudo apt-get install -y ufw
else
    echo "UFW is already installed."
fi

# Default ports to always allow 22 for nginx proxy manager admin ui
default_ports=(22 80 443 81)

# Custom application ports (Add your custom ports here)
app_ports=(2001 3001 3002 4001 5001 6001)

# Combine all ports into a single array
all_ports=("${default_ports[@]}" "${app_ports[@]}")

# Open the specified ports
for port in "${all_ports[@]}"; do
    echo "Allowing port $port..."
    sudo ufw allow "${port}/tcp"
done

# Enable UFW if not already enabled
if sudo ufw status | grep -q "inactive"; then
    echo "Enabling UFW..."
    sudo ufw --force enable
else
    echo "UFW is already enabled."
fi

# Set default policies to deny all incoming connections except allowed ones
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Reload UFW to apply all changes
sudo ufw reload

# Display UFW status to verify the rules
sudo ufw status verbose

echo "UFW setup complete. All specified ports are now open."
