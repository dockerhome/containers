#!/bin/bash

source .config

docker stop $NAME
docker rm $NAME

[ ! -d $LOCAL_FOLDER/$NAME ] && mkdir -p $LOCAL_FOLDER/$NAME

docker run --name $NAME \
    --restart always \
	-v $LOCAL_FOLDER/$NAME:$CONTAINER_PATH_PUBLIC \
	-p $LOCAL_IP:$LOCAL_PORT:$CONTAINER_PORT \
	-p $LOCAL_IP:$LOCAL_PORT_2:$CONTAINER_PORT_2 \
	--network=$NETWORK \
	-d $CONTAINER


# Working directory for running a php script
#	-w $CONTAINER_PATH \

#	-v $LOCAL_FOLDER/$NAME:$CONTAINER_PATH_APP \
#	-v $LOCAL_FOLDER/$NAME/public:$CONTAINER_PATH_PUBLIC \

docker ps

exit 0
