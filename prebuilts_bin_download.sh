#!/bin/bash

HOST="https://repo.huaweicloud.com"

GN_TARBALL="gn-linux-x86-20240115.tar.gz"
GN_URL="$HOST/openharmony/compiler/gn/20240115/linux/$GN_TARBALL"

NINJA_TARBALL="ninja-linux-x86-1.11.0.tar.gz"
NINJA_URL="$HOST//openharmony/compiler/ninja/1.11.0/linux/$NINJA_TARBALL"

UNZIP_DIR="prebuilts/build-tools/linux-x86/bin"

if [ ! -e $UNZIP_DIR ]; then
    mkdir -p $UNZIP_DIR
fi

if [ ! -e $GN_TARBALL ]; then
    wget $GN_URL
fi

if [ ! -e $NINJA_TARBALL ]; then
    wget $NINJA_URL
fi

tar -C $UNZIP_DIR -xvf $GN_TARBALL
tar -C $UNZIP_DIR -xvf $NINJA_TARBALL
