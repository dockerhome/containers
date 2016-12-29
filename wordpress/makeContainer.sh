#!/bin/bash

source .config

docker stop $NAME
docker rm $NAME

[ ! -d $LOCAL_FOLDER/$NAME ] && mkdir -p $LOCAL_FOLDER/$NAME

docker run --name $NAME \
    --restart always \
	-v $LOCAL_FOLDER/$NAME:$CONTAINER_FOLDER \
	--link $DB_SERVER_NAME:mysql \
	-e WORDPRESS_DB_USER=$MYSQL_USER \
	-e WORDPRESS_DB_PASSWORD=$MYSQL_PASSWORD \
	-e WORDPRESS_DB_NAME=$MYSQL_DATABASE \
#	-p $LOCAL_IP:$LOCAL_PORT:$CONTAINER_PORT \
	-p $LOCAL_IP:$LOCAL_PORT:$CONTAINER_PORT \
	-d $CONTAINER

docker ps

exit 0
