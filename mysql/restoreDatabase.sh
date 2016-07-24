# Restore Database

source .config

docker exec -i $NAME \
	mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < $DUMP_FILE

exit 0
