#!/bin/bash
set -e

# compile 
# cd ./hellomod
# make install
# cd ..

# uncompress
cp ./dist/rootfs.cpio.bz2 ./rootfs
bzip2 -d ./rootfs/rootfs.cpio.bz2
cd ./rootfs
cpio -idv < rootfs.cpio
rm rootfs.cpio
