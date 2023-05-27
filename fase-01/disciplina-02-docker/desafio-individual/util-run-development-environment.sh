#!/bin/env bash

set -ev

docker compose \
    -f docker-compose-development.yml \
    rm \
    --force

docker compose \
    -f docker-compose-development.yml \
    up
