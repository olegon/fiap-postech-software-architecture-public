#!/bin/env bash

set -ev

docker build \
    -t olegon/fiap-soat-docker-dotnet-challenge:latest \
    .
