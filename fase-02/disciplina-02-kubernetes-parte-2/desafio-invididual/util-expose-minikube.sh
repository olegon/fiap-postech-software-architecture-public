#/bin/env bash

set -e

# Exposing apps

if ! ss -ltn | grep ':6379' > /dev/null; then
    kubectl port-forward services/redis 6379 > /dev/null &
else
    >&2 echo "Port 6379 is already in use."
fi

if ! ss -ltn | grep ':3000' > /dev/null; then
    kubectl port-forward services/backend 3000:80 > /dev/null &
else
    >&2 echo "Port 3000 is already in use."
fi

if ! ss -ltn | grep ':8080' > /dev/null; then
    kubectl port-forward services/frontend 8080:80 > /dev/null &
else
    >&2 echo "Port 8080 is already in use."
fi

if ! ss -ltn | grep ':5601' > /dev/null; then
    kubectl port-forward services/kibana 5601 > /dev/null &
else
    >&2 echo "Port 5601 is already in use."
fi

if ! ss -ltn | grep ':9200' > /dev/null; then
    kubectl port-forward services/elasticsearch 9200 > /dev/null &
else
    >&2 echo "Port 9200 is already in use."
fi
