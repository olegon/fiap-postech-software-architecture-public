#/bin/env bash

set -e

# Validating minikube execution

if ! minikube status > /dev/null; then
    >&2 echo "Minikube is not running"
    exit 1
fi


# Enabling minikube addons

minikube addons enable metrics-server

minikube addons enable dashboard

minikube addons enable ingress
