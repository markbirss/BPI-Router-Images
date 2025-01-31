# BPI-Router-Images

```
git clone -b gdrive-test https://github.com/markbirss/BPI-Router-Images
cd BPI-Router-Images

chmod +x ./go.sh
./go.sh

cp sourcefiles_board.conf sourcefiles_bpi-r4.conf

./buildimg.sh bpi-r4 bookworm
```

[www]
https://forum.banana-pi.org/t/bpi-r4-sd-debian-bookworm-bullseye-images-on-kernel-6-8-0-dango/17487/12








## examples:

```sh
./buildimg.sh bpi-r3 bookworm
./buildimg.sh bpi-r4 jammy

#use kernel 6.12 for r2 (normally 5.15 is used because of internal wifi support)
./buildimg.sh bpi-r2 bookworm 6.12
```

## use own uboot/kernel files

for boards not yet supported by my u-boot/kernel pipeline
or for emmc it may be needed to use own compiled packages.

the buildimg.sh reads a configfile named sourcefiles_board.conf where 'board'
is the supplied board name (e.g. "bpi-r4").

to use your own compiled uboot base-image (created by "build.sh createimg" in my uboot repo)
use this setting:
```
skipubootdownload=1
imgfile=bpi-r4_sdmmc.img.gz
```
for own kernel-package (created by "build.sh pack" in my kernel repo) use this:
```
skipkerneldownload=1
kernelfile=bpi-r4_6.5.0-rc1.tar.gz
```
both configs can be used together to not download anything from my github releases.

## how add packages

add this option in the sourcefiles_board.conf

```sh
userpackages="ethtool iperf3 tcpdump"
```

## how to write image

```sh
gunzip -c bpi-r3_sdmmc.img.gz | sudo dd bs=1M status=progress conv=notrunc,fsync of=/dev/sdX
```

## first bootup

### login

user: root
password: bananapi

ssh root-login enabled (should be disabled after other users are created)

/etc/ssh/sshd_config (open e.g. with nano):
add # before PermitRootLogin=yes
and restart ssh daemon

```sh
systemctl restart ssh
```
