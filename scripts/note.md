gcloud compute --project "that-big-universe" ssh --zone "us-west1-a" "elastic-node-1"
gcloud compute --project "that-big-universe" ssh --zone "us-west1-a" "elastic-node-2"
gcloud compute --project "that-big-universe" ssh --zone "us-west1-a" "elastic-node-3"

bootstrap.mlockall: true

This doesn't work so far, need to figure this out.

cluster:
  name: hub-mud-cluster


gcloud compute --project "that-big-universe" ssh --zone "us-west1-a" "elastic-node-1" --command "sudo chmod 700 ./node1.sh && sudo ./node1.sh"

gcloud compute --project "that-big-universe" ssh --zone "us-west1-a" "elastic-node-1" --command 'sudo echo "#  Configured for Node 1.

cluster.name: hub-mud-cluster
bootstrap.mlockall: true

" >> /etc/elasticsearch/elasticsearch.yml'



http://devopscube.com/how-to-setup-an-elasticsearch-cluster/
