#! /bin/bash

HOST_ARCH=x86_64
VERSION=v2.9.1-1

mkdir -p build
cd build

for target_arch in $*; do
  wget -N https://github.com/multiarch/qemu-user-static/releases/download/$VERSION/${HOST_ARCH}_qemu-${target_arch}-static.tar.gz
  tar -xvf ${HOST_ARCH}_qemu-${target_arch}-static.tar.gz
  rm ${HOST_ARCH}_qemu-${target_arch}-static.tar.gz
  mv qemu-${target_arch}-static /usr/bin/
done