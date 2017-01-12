#!/bin/bash

# Check if any .config option was sent
if [ $1 ]; then
    source $1
else 
    source .config
fi

OPTIONS="{
    \"type\": \"fs\",
    \"settings\": {
        \"location\": \"$SNAPSHOT_LOCATION/$SNAPSHOT_GROUP\",
        \"compress\": true
    }
}"

echo 
echo 'Registerin a local snapshot folder:'
echo
echo $OPTIONS | curl -XPUT $HOST:$PORT/_snapshot/$SNAPSHOT_GROUP?pretty -d @-
echo
curl -XPOST "$HOST:$PORT/_snapshot/$SNAPSHOT_GROUP/_verify?pretty"
echo
curl -XGET "$HOST:$PORT/_snapshot/$SNAPSHOT_GROUP?pretty"
echo
echo

exit 0
