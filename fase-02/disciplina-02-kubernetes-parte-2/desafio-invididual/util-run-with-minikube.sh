#/bin/env bash

set -e


# Targeting minikube dockerd

eval $(minikube docker-env)


# Building apps

(cd backend && docker build -t local/backend:latest .)

(cd frontend && docker build -t local/frontend:latest .)


# Running apps

kubectl apply -f k8s-manifests/
