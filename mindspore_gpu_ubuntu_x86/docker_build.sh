#!/bin/bash

# Global parameter
CURR_DIR=`dirname "${BASH_SOURCE-$0}"`
CURR_DIR=`cd -P "${CURR_DIR}"; pwd -P`

# Build compile docker image
eco "[INFO] Build compile docker image."
docker build -t mindspore_gpu_ubuntu_x86:16.04 `pwd`
