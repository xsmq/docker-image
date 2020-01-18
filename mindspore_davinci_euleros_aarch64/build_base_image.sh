#!/bin/bash

# Global parameter
CURR_DIR=`dirname "${BASH_SOURCE-$0}"`
CURR_DIR=`cd -P "${CURR_DIR}"; pwd -P`
mount_path="/mnt/iso/euleros28"

# Download iso(euleros2.8 aarch64)
cd ${CURR_DIR}
if [ ! -f ${CURR_DIR}/EulerOS-V2.0SP8-aarch64-dvd.iso ]; then
    wget http://59.36.11.51/productrepo/iso/EulerOS_Server_V200R008C00SPC201B530/EulerOS-V2.0SP8-aarch64-dvd.iso
fi

# Mount iso
mkdir -pv ${mount_path}
mount -t iso9660 -o loop ${CURR_DIR}/EulerOS-V2.0SP8-aarch64-dvd.iso ${mount_path}

# Build docker base image
cd ${CURR_DIR}/../euleros-docker-images/scripts
export OS_VERSION=2.8
export ISO_PATH=${mount_path}
export RPM_ROOT=$(cd ${CURR_DIR}/../;pwd)/euleros-docker-images/scripts/rootfs
bash generate.sh
