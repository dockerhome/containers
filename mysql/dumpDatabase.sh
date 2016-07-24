# Dump database

source .config

[ ! -d $DUMP_PATH/$NAME ] && mkdir -p $DUMP_PATH/$NAME

docker exec $NAME \
	 sh -c 'exec mysqldump $MYSQL_DATABASE -uroot -p"$MYSQL_ROOT_PASSWORD"' > $DUMP_PATH/$NAME/$MYSQL_DATABASE.sql

exit 0
