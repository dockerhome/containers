#!/bin/bash

source .config

docker stop $NAME
docker rm $NAME

docker run --name $NAME \
	-v $LOCAL_FOLDER/$NAME:$CONTAINER_FOLDER \
	-e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
	-e MYSQL_DATABASE=$MYSQL_DATABASE \
	-e MYSQL_USER=$MYSQL_USER \
	-e MYSQL_PASSWORD=$MYSQL_PASSWORD \
	-d -P $CONTAINER \
	--character-set-server=utf8 \
	--collation-server=utf8_general_ci

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
