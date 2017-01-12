#!/bin/bash

# Check if any .config option was sent
if [ $1 ]; then
    source $1
else 
    source .config
fi

# Check if container and a name was informed
if [ -z $CONTAINER ] || [ -z $NAME ]; then
    echo 'Please inform a container to run and its name'
fi


# Create RUN_SCRIPT
RUN_SCRIPT='-d' # Run with '-d' in background mode
#RUN_SCRIPT="$RUN_SCRIPT "

# Name
if [ ! -z $NAME ]; then
    RUN_SCRIPT="$RUN_SCRIPT --name $NAME"
fi

# Volumes
if [ ! "${#FOLDER_DATA[@]}" -eq 0 ]; then
    for container_folder in "${!FOLDER_DATA[@]}"
    do
        local_folder="${FOLDER_DATA[$container_folder]}"
        RUN_SCRIPT="$RUN_SCRIPT -v $local_folder:$container_folder"
    done
fi

# Ports
if [ ! ${#OPEN_PORTS[@]} -eq 0 ]; then
    for container_port in "${!OPEN_PORTS[@]}"
    do
        local_port="${OPEN_PORTS[$container_port]}"
        if [ ! -z $LOCAL_IP ]; then
            RUN_SCRIPT="$RUN_SCRIPT -p $LOCAL_IP:$local_port:$container_port"
        else
            RUN_SCRIPT="$RUN_SCRIPT -p $local_port:$container_port"
        fi
    done
fi

# Should always restart the container?
if [ ! -z $RESTART ]; then
    RUN_SCRIPT="$RUN_SCRIPT --restart $RESTART"
fi

# Is read only?
if [ ! -z $READ_ONLY ]; then
    RUN_SCRIPT="$RUN_SCRIPT --read-only"
fi

# Has any network?
if [ ! -z $NETWORK ]; then
    RUN_SCRIPT="$RUN_SCRIPT --network=$NETWORK"
else
    RUN_SCRIPT="$RUN_SCRIPT -P"
fi

# Container name
RUN_SCRIPT="$RUN_SCRIPT $CONTAINER"

# Has any extra configuration parameters?
if [ ! -z "$EXTRA_CONFIG" ]; then
    RUN_SCRIPT="$RUN_SCRIPT $EXTRA_CONFIG"
fi

echo 'Command:'
echo "dcoker run $RUN_SCRIPT"

docker stop $NAME
docker rm $NAME
docker run $RUN_SCRIPT

docker ps

exit 0

