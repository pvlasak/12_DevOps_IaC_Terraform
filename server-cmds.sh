#!/usr/bin/env bash
set -e

export IMAGE=$1
export DOCKER_USER=$2

docker login -u $DOCKER_USER --password-stdin
docker-compose -f docker-compose.yaml up --detach
echo "success"