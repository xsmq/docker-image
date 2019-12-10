#!/bin/bash

# Import base image
echo "[INFO] Import base images"
docker images|grep "euleros"|grep "2.5"
if [ $? -eq 0 ]; then
    docker rmi -f euleros:2.5
fi
cat euleros-docker-images/scripts/x86_64/EulerOS-2.5-x86_64.tar.xz|docker import - euleros:2.5

# Build compile docker image
eco "[INFO] Build compile docker image."
docker build -t euleros_mindspore_davinci:2.5 `pwd`
