#!/bin/bash
# Update the package repository
yum update -y

# Install Nginx (Amazon Linux 2)
amazon-linux-extras install -y nginx1

# Start and enable Nginx service
systemctl start nginx
systemctl enable nginx

# Create a simple webpage
echo "<h1>Welcome to My Web Server</h1>" > /usr/share/nginx/html/index.html

# Ensure proper permissions
chmod -R 755 /usr/share/nginx/html
chown -R nginx:nginx /usr/share/nginx/html
