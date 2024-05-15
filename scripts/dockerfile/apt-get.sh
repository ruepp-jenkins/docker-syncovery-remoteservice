#!/bin/bash
set -e
echo "Install packages"

apt-get update
apt-get install -y \
    bash \
    ca-certificates \
    openssl \
    p7zip \
    p7zip-full \
    p7zip-rar \
    tzdata \
    unzip \
    wget \
    zip
