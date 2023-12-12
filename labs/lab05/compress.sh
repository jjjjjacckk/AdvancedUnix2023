#!/bin/bash
set -e
# compile 
cd hellomod
make install
cd ..

# move test files 
cp -r ./dist/tests ./rootfs

# pack up modules
cd ./rootfs
find . -print | cpio -ov -H newc -F ../rootfs.cpio
cd ..
bzip2 -z ./rootfs.cpio 
mv ./rootfs.cpio.bz2 ./dist