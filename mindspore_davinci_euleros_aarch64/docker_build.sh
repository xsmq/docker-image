#!/bin/bash

# Global parameter
CURR_DIR=`dirname "${BASH_SOURCE-$0}"`
CURR_DIR=`cd -P "${CURR_DIR}"; pwd -P`

# Import base image
#echo "[INFO] Import base images"
#docker images|grep "euleros_aarch64"|grep "2.8"
#if [ $? -eq 0 ]; then
#    docker rmi -f euleros_aarch64:2.8
#fi
#cat ${CURR_DIR}/../euleros-docker-images/scripts/aarch64/EulerOS-2.8-aarch64.tar.xz|docker import - euleros_aarch64:2.8

# Build compile docker image
eco "[INFO] Build compile docker image."
docker build -t mindspore_davinci_euleros_aarch64:2.8 `pwd`
