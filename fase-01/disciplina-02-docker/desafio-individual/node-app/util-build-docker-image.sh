#!/bin/env bash

set -ev

docker build \
    -t olegon/fiap-soat-docker-node-challenge:latest \
    .
