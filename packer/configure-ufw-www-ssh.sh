#!/usr/bin/env bash

sudo apt-get install ufw
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
echo "y" | sudo ufw enable