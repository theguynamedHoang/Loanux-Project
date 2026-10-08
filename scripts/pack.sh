#!/bin/bash
set -e
L=$HOME/build/loanux; IMG=$HOME/build/loanux.img; M=/mnt/loanux
sudo umount $M 2>/dev/null || true
rm -f "$IMG"; truncate -s 1G "$IMG"
mkfs.ext4 -F -q -L LOANUX "$IMG"
sudo mkdir -p $M
sudo mount -o loop "$IMG" $M
sudo rsync -a --chown=0:0 "$L"/ $M/
sudo chown -R 1000:1000 $M/users/home/user
sudo mknod -m 600 $M/dev/console c 5 1
sudo mknod -m 666 $M/dev/null c 1 3
sudo chmod 1777 $M/kernel/var/tmp
sudo umount $M
echo "OK -> $IMG"
