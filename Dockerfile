ARG IMAGE_ARCH=linux/arm/v7
ARG IMAGE_TAG=bullseye-slim
FROM --platform=$IMAGE_ARCH debian:$IMAGE_TAG AS base_armhf

ARG DEBIAN_FRONTEND=noninteractive
ONBUILD ARG DEBIAN_FRONTEND=noninteractive

# Upgrade & install required packages
RUN apt update \
    && apt upgrade -y \
    && apt install -y --no-install-recommends \
        sudo \
        ca-certificates \
        netbase apt-utils iputils-ping curl \
        build-essential bison bc git dialog patch dosfstools zip unzip parted nano util-linux hdparm \
        debootstrap rsync kmod cpio flex libssl-dev libncurses5-dev \
        device-tree-compiler libfdt-dev python3-distutils python3-dev swig fakeroot \
        lzop lz4 aria2 pv u-boot-tools \
        distro-info-data lsb-release libelf-dev fdisk kpartx ccache xz-utils \
        python-is-python2 python-dev-is-python2 zstd \
        colorized-logs gdisk jq wget btrfs-progs xfsprogs \
	    python3-setuptools \         
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
