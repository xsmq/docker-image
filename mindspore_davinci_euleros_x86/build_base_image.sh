#!/bin/bash

# Global parameter
CURR_DIR=`dirname "${BASH_SOURCE-$0}"`
CURR_DIR=`cd -P "${CURR_DIR}"; pwd -P`
mount_path="/mnt/iso/euleros25"

# Download iso(euleros2.5 x86_64)
cd ${CURR_DIR}
if [ ! -f ${CURR_DIR}/EulerOS-V2.0SP5-x86_64-dvd.iso ]; then
    wget https://euleros2019.obs.cn-north-1.myhuaweicloud.com/ict/site-euleros/euleros/repo/yum/2.5/os/x86_64/iso/EulerOS-V2.0SP5-x86_64-dvd.iso
fi

# Mount iso
mkdir -pv ${mount_path}
mount -t iso9660 -o loop ${CURR_DIR}/EulerOS-V2.0SP5-x86_64-dvd.iso ${mount_path}

# Build docker base image
cd ${CURR_DIR}/../euleros-docker-images/scripts
export OS_VERSION=2.5
export ISO_PATH=${mount_path}
export RPM_ROOT=$(cd ${CURR_DIR}/../;pwd)/euleros-docker-images/scripts/rootfs
bash generate.sh
