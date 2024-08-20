# How to Use the Script

## Save the Script

Save the above script as `setup_ufw.sh` on your Ubuntu server.

## Make the Script Executable

Run the following command to make the script executable:

```bash
chmod +x setup_ufw.sh
```

## Execute the script with:

```bash
./setup_ufw.sh
```

## What Does the Script Do?

This script will install UFW, configure it with the necessary rules for SSH and Nginx Proxy Manager, and enable the firewall with appropriate security settings. It also sets the default policy to deny incoming connections except those explicitly allowed, ensuring your server is secure.
