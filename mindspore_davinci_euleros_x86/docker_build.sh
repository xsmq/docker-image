#!/bin/bash

# Global parameter
CURR_DIR=`dirname "${BASH_SOURCE-$0}"`
CURR_DIR=`cd -P "${CURR_DIR}"; pwd -P`

# Import base image
echo "[INFO] Import base images"
docker images|grep "euleros_x86"|grep "2.5"
if [ $? -eq 0 ]; then
    docker rmi -f euleros_x86:2.5
fi
cat ${CURR_DIR}/../euleros-docker-images/scripts/x86_64/EulerOS-2.5-x86_64.tar.xz|docker import - euleros_x86:2.5

# Build compile docker image
eco "[INFO] Build compile docker image."
docker build -t mindspore_davinci_euleros_x86:2.5 `pwd`
