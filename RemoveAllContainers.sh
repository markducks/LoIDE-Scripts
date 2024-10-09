#!/bin/bash

if [[ -n "$(docker ps -q)" ]]; then
    docker rm -vf $(docker ps -aq)
else
    echo "No containers to remove."
fi