#!/bin/bash

source .config

docker stop $NAME
docker rm $NAME

docker run -d --name $NAME \
	-v $LOCAL_FOLDER/$NAME:$CONTAINER_FOLDER \
	-p $LOCAL_IP:$LOCAL_PORT:$CONTAINER_PORT \
	-p $LOCAL_IP:$LOCAL_PORT_2:$CONTAINER_PORT_2 \
	-e ES_JAVA_OPTS="-Xms1g -Xmx1g" \
	-P $CONTAINER
	-D node.name=$NODE_NAME
#	-Des.node.name=$NODE_NAME

#docker exec

docker ps
#docker ps -a

# @TODO
#
# 1. Colocar IP desse contianer no arquivo hosts /etc/hosts com o nome do container
#
# 2. Definir função inicial para ler um arquivos como parametro --config=.config_xyz ou o padrão '.config'
#
#

exit 0
