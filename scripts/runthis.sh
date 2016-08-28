#!/bin/bash

cd ../
terraform apply
cd scripts

gcloud compute copy-files ./node1.sh elastic-node-1:~/ --zone us-west1-a
gcloud compute copy-files ./node2.sh elastic-node-2:~/ --zone us-west1-a
gcloud compute copy-files ./node3.sh elastic-node-3:~/ --zone us-west1-a

gcloud compute --project "that-big-universe" ssh --zone "us-west1-a" "elastic-node-1" --command "\
sudo chmod 700 ./node1.sh && \
sudo ./node1.sh && \
sudo service elasticsearch start"

gcloud compute --project "that-big-universe" ssh --zone "us-west1-a" "elastic-node-2" --command "\
sudo chmod 700 ./node2.sh && \
sudo ./node2.sh && \
sudo service elasticsearch start"

gcloud compute --project "that-big-universe" ssh --zone "us-west1-a" "elastic-node-3" --command "\
sudo chmod 700 ./node3.sh && \
sudo ./node3.sh && \
sudo service elasticsearch start"

./readstatus.sh
