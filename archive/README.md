README.md

uncompressed with:

cat archive.tar.* | tar -xzvf -


compressed with

tar -czvf - ./6.13-rc/ | split -b 20M - archive.tar.gz
