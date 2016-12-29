#!/bin/bash

source .config

docker stop $NAME
docker rm $NAME

[ ! -d $LOCAL_FOLDER/$NAME ] && mkdir -p $LOCAL_FOLDER/$NAME

docker run --name $NAME \
    --restart always \
	--link $DB_SERVER_NAME:db \
	-p $LOCAL_IP:$LOCAL_PORT:$CONTAINER_PORT \
	-d $CONTAINER



#	-v $LOCAL_FOLDER/$NAME:$CONTAINER_FOLDER/$NAME \

docker ps

exit 0
