#!/bin/bash

source .config

docker stop $NAME
docker rm $NAME

docker run --name $NAME \
	-v $LOCAL_FOLDER/$DATA_FOLDER:/usr/share/elasticsearch/data \
	-d $CONTAINER \
	-Des.node.name=$NODE_NAME \
	-Des.cluster.name=$CLUSTER_NAME

echo "docker run --name $NAME \
	-v $LOCAL_FOLDER/$CONFIG_FOLDER:/usr/share/elasticsearch/config \
	-v $LOCAL_FOLDER/$DATA_FOLDER:/usr/share/elasticsearch/data \
	-Des.node.name=$NODE_NAME \
	-d $CONTAINER"



docker ps

exit 0
