#!/bin/bash

source .config

docker stop $NAME
docker rm $NAME

[ ! -d $LOCAL_FOLDER/$NAME ] && mkdir -p $LOCAL_FOLDER/$NAME

docker run --name $NAME \
	-v $LOCAL_FOLDER/$NAME:$CONTAINER_PATH \
	-p $LOCAL_IP:$LOCAL_PORT:$CONTAINER_PORT \
	-d $CONTAINER


# Working directory for running a php script
#	-w $CONTAINER_PATH \

docker ps

exit 0
