#!/usr/bin/env bash

# Add repo & key to list.
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb http://packages.elastic.co/kibana/4.5/debian stable main" | sudo tee -a /etc/apt/sources.list

# Update apt-get and install.
sudo apt-get update
sudo apt-get install kibana

# Setup init start
#sudo update-rc.d kibana defaults 95 10

# Setup Systemd start
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable kibana.service
