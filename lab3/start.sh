#!/bin/bash




build_project() {
    local dir=$1

    echo "Building Docker image in $dir..."
    (cd "$dir" && make docker-build)
}


build_project "client"
build_project "server"


echo "Starting docker-compose..."
docker-compose up

