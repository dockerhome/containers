# Dump database

source .config

[ ! -d $DUMP_PATH ] && mkdir -p $DUMP_PATH

docker exec $NAME \
	 sh -c 'exec mysqldump $MYSQL_DATABASE -uroot -p"$MYSQL_ROOT_PASSWORD"' > $DUMP_FULLFILE

echo 'Database "$MYSQL_DATABASE" dumped to:'
echo $DUMP_FULLFILE

exit 0
