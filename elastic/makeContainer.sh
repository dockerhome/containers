#!/bin/bash

# Check if any .config option was sent
if [ $1 ]; then
    source $1
else 
    source .config
fi

docker stop $NAME
docker rm $NAME

#docker run -d --read-only --name $NAME \
docker run -d --name $NAME \
	--restart always \
	-v $LOCAL_FOLDER/$NAME:$CONTAINER_FOLDER \
	-v $CONFIG_FOLDER:$CONTAINER_CONFIG_FOLDER \
	-p $LOCAL_IP:$LOCAL_PORT:$CONTAINER_PORT \
	-p $LOCAL_IP:$LOCAL_PORT_2:$CONTAINER_PORT_2 \
	-P $CONTAINER \
	-E node.name=$NODE_NAME


#	-v $CONFIG_FOLDER:$CONTAINER_CONFIG_FOLDER \
#	-e ES_JAVA_OPTS="-Xms1g -Xmx1g" \

docker ps

exit 0
