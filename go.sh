#!/bin/sh

cd archive/
cat archive.tar.* | tar -xzvf -
mv 6.13-rc/bpi-r4_6.13.0-rc3.tar.gz ../
cd ../
