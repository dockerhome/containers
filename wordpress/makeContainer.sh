#!/bin/bash

source .config

docker stop $NAME
docker rm $NAME

[ ! -d $LOCAL_FOLDER/$NAME ] && mkdir -p $LOCAL_FOLDER/$NAME

docker run --name $NAME \
	-v $LOCAL_FOLDER/$NAME:$CONTAINER_FOLDER \
	--network=$NETWORK \
	-e WORDPRESS_DB_USER=$MYSQL_USER \
	-e WORDPRESS_DB_PASSWORD=$MYSQL_PASSWORD \
	-e WORDPRESS_DB_NAME=$MYSQL_DATABASE \
	-p $LOCAL_IP:$LOCAL_PORT:$CONTAINER_PORT \
	-d $CONTAINER

#    --restart always \

docker ps

exit 0
