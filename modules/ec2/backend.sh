#!/bin/bash

# Update system

sudo apt update -y

# Install Node.js + npm + git

sudo apt install -y curl git
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Install PM2 (process manager)

sudo npm install -g pm2

# Clone repo

cd /home/ubuntu
git clone https://github.com/vaironix/Simple-Blog-App.git

# Go to backend directory

cd Simple-Blog-App/backend

# Install dependencies

npm install

# Start app using PM2

pm2 start server.js --name blog-backend

# Save PM2 process

pm2 save
pm2 startup systemd -u ubuntu --hp /home/ubuntu

echo "Backend deployed successfully!"
pm2 start server.js
pm2 save
pm2 startup systemd -u ubuntu --hp /home/ubuntu