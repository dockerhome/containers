#!/bin/bash

source .config

docker stop $NAME
docker rm $NAME

docker run --name $NAME \
	-v $LOCAL_FOLDER/$NAME:$CONTAINER_FOLDER \
	--link $DB_SERVER_NAME:mysql \
	-e WORDPRESS_DB_USER=$MYSQL_USER \
	-e WORDPRESS_DB_PASSWORD=$MYSQL_PASSWORD \
	-e WORDPRESS_DB_NAME=$MYSQL_DATABASE \
	-p $LOCAL_PORT:80 \
	-d $CONTAINER

docker ps

exit 0
