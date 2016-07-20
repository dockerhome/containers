#!/bin/bash

source .config

docker stop $NAME
docker rm $NAME

docker run --name $NAME \
	-v $LOCAL_FOLDER/$NAME:$CONTAINER_FOLDER \
	-e MYSQL_ROOT_PASSWORD=$ROOT_PASSWORD \
	-e MYSQL_DATABASE=$MYSQL_DATABASE \
	-e MYSQL_USER=$MYSQL_USER \
	-e MYSQL_PASSWORD=$MYSQL_PASSWORD \
	-d -P $CONTAINER

docker ps
#docker ps -a

exit 0
