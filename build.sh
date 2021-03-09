#!/bin/bash

TMPDIR=openwrt_rootfs
[ -d "$TMPDIR" ] && rm -rf "$TMPDIR"

mkdir -p "$TMPDIR"  && \
gzip -dc openwrt-armvirt-64-default-rootfs.tar.gz | ( cd "$TMPDIR" && tar xf - ) && \
cp -f rc.local "$TMPDIR/etc/" && \
rm -f "$TMPDIR/etc/bench.log" && \
(cd "$TMPDIR" && tar cf ../openwrt-armvirt-64-default-rootfs-patched.tar .)
rm -rf "$TMPDIR"