#!/bin/bash

source .config

docker stop $NAME
docker rm $NAME

docker run --name $NAME \
	-v $LOCAL_FOLDER/$NAME:$CONTAINER_FOLDER \
	-v $CONF_LOCAL:$CONF_SERVER \
	-p $LOCAL_IP:$LOCAL_PORT:$CONTAINER_PORT \
	-e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
	-e MYSQL_DATABASE=$MYSQL_DATABASE \
	-e MYSQL_USER=$MYSQL_USER \
	-e MYSQL_PASSWORD=$MYSQL_PASSWORD \
	-d -P $CONTAINER \
	--character-set-server=$CHARSET \
	--collation-server=$COLLATION

docker ps

exit 0