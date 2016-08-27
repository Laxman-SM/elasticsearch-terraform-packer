#!/usr/bin/env bash
# Get the PGP Key
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# Save repository.
echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list

# Install apt-transport-https
sudo apt-get install apt-transport-https

# Update apt-get.
sudo apt-get update

echo "Installing Elasticsearch via apt-get."
sudo apt-get install elasticsearch

echo "Stopping Elasticsearch while changes are made and set."
sudo service elasticsearch stop

echo "Starting Elasticsearch to autostart."
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo /bin/systemctl start elasticsearch.service

echo "Starting Elasticsearch again."
sudo service elasticsearch start
echo "Done."
