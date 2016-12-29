#!/bin/bash

source .config

docker stop $NAME
docker rm $NAME

[ ! -d $LOCAL_FOLDER/$NAME ] && mkdir -p $LOCAL_FOLDER/$NAME

docker run --name $NAME \
    --restart always \
	-v $LOCAL_FOLDER/$NAME:$FTP_PATH \
	-e FTP_USER=$FTP_USER \
	-e FTP_PASSWORD=$FTP_PASSWORD \
	-e FTP_UID=$FTP_UID \
	-e FTP_GID=$FTP_GID \
	-p $LOCAL_IP:$LOCAL_PORT:$CONTAINER_PORT \
	-p $LOCAL_IP:$LOCAL_PORT2:$CONTAINER_PORT2 \
	-d $CONTAINER

docker ps

exit 0
