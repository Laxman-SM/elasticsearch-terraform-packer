#!/bin/bash
cd ../
terraform apply
cd scripts

gcloud compute copy-files ./node1.sh elastic-node-1:~/ --zone us-west1-a
gcloud compute copy-files ./node2.sh elastic-node-2:~/ --zone us-west1-a
gcloud compute copy-files ./node3.sh elastic-node-3:~/ --zone us-west1-a

node=1

gcloud compute --project "that-big-universe" ssh --zone "us-west1-a" "elastic-node-$node" --command "\
sudo chmod 700 ./node$node.sh && \
sudo ./node$node.sh && \
sudo service elasticsearch start"

node=2

gcloud compute --project "that-big-universe" ssh --zone "us-west1-a" "elastic-node-$node" --command "\
sudo chmod 700 ./node$node.sh && \
sudo ./node$node.sh && \
sudo service elasticsearch start"

node=3

gcloud compute --project "that-big-universe" ssh --zone "us-west1-a" "elastic-node-$node" --command "\
sudo chmod 700 ./node$node.sh && \
sudo ./node$node.sh && \
sudo service elasticsearch start"

./readstatus.sh
