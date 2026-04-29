#!/bin/bash

# Update system

sudo apt update -y

# Install Node.js (LTS) + npm + nginx + git

sudo apt install -y curl git nginx
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Clone repo

cd /home/ubuntu
git clone https://github.com/vaironix/Simple-Blog-App.git

# Go to frontend directory

cd Simple-Blog-App/frontend

# Install dependencies

npm install

# Build React app

npm run build

# Remove default nginx config

sudo rm -rf /var/www/html/*

# Copy build files to nginx

sudo cp -r build/* /var/www/html/

# Restart nginx

sudo systemctl restart nginx
sudo systemctl enable nginx

echo "Frontend deployed successfully!"
