echo "Copying elasticsearch.yml to location."
sudo cp elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
echo "Copied elasticsearch.yml to location '/etc/elasticsearch/elasticsearch.yml'."

echo "Starting Elasticsearch again."
sudo service elasticsearch start

echo "Done."

# Test Elasticsearch
# curl -X GET 'http://localhost:9200'
