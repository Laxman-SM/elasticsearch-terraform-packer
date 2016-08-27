#!/usr/bin/env bash

# ./set-elastic-yaml.sh "quotecenter.net" "testing-elastic-1"

DOMAIN=$1
THISSERVER=$2
ELASTIC1="testing-elastic-1.$DOMAIN"
ELASTIC2="testing-elastic-2.$DOMAIN"
ELASTIC3="testing-elastic-3.$DOMAIN"
ELASTIC4="testing-elastic-4.$DOMAIN"

echo "#  Configured for $THISTHING

cluster.name: es-monitor
bootstrap.mlockall: true
network host: 0.0.0.0
discovery.zen.ping.unicast.hosts: [\"$ELASTIC1\", \"$ELASTIC2\", \"$ELASTIC3\", \"$ELASTIC4\"]

" >> test.elasticsearch.yml
