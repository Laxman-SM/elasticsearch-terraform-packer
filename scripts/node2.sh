#!/bin/bash
ipaddress=$(eval /sbin/ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')

echo $ipaddress

sudo echo "# Configured for Node 2 & $ipaddress.

node.name: elastic-node-2
cluster.name: hub-mud-cluster
bootstrap.mlockall: true
network.host: $ipaddress

" >> /etc/elasticsearch/elasticsearch.yml
