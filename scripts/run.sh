#!/bin/bash
L=$HOME/build/loanux
K=$L/boot/vmlinuz; [ -f "$K" ] || K=$L/boot/vmloanux
qemu-system-x86_64 -m 512M -nographic \
  -kernel "$K" \
  -drive file=$HOME/build/loanux.img,format=raw,if=virtio \
  -append "root=/dev/vda rw init=/kernel/usr/sbin/init console=ttyS0" \
  "$@"
