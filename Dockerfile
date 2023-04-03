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
        netbase apt-utils \
        make fdisk parted udev debootstrap pv xz-utils \         
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
