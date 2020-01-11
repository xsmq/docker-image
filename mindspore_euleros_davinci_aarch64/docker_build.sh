#!/bin/bash

# Import base image
echo "[INFO] Import base images"
docker images|grep "euleros"|grep "2.8"
if [ $? -eq 0 ]; then
    docker rmi -f euleros:2.8
fi
cat euleros-docker-images/scripts/aarch64/EulerOS-2.8-aarch64.tar.xz|docker import - euleros:2.8

# Build compile docker image
eco "[INFO] Build compile docker image."
docker build -t euleros_mindspore_davinci:2.8 `pwd`
