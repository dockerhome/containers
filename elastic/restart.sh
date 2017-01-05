#!/bin/bash

# Check if any .config option was sent
if [ $1 ]; then
    source $1
else
    source .config
fi

docker stop $NAME
docker start $NAME

