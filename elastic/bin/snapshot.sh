#!/bin/bash

# Check if any .config option was sent
if [ $1 ]; then
    source $1
else 
    source .config
fi

OPTIONS="$HOST:$PORT/_snapshot/$SNAPSHOT_GROUP/$SNAPSHOT_NAME?wait_for_completion=true"

echo 
echo 'Creating a snapshot:'
echo
curl -XPUT "$HOST:$PORT/_snapshot/$SNAPSHOT_GROUP/$SNAPSHOT_NAME?wait_for_completion=true"
echo
curl -XGET "$HOST:$PORT/_snapshot/$SNAPSHOT_GROUP/$SNAPSHOT_NAME?pretty"
echo
echo

exit 0
