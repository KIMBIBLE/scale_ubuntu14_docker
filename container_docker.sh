#!/bin/sh
NAME="scale_ubuntu_14.04"

PORT="-p 8080:8080 -p 8081:8081"
#OPTION="--rm"

sudo docker run --name $NAME $PORT -i -t $OPTION $SHARED $NAME:1.0 /bin/sh
