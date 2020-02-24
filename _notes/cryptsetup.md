---
layout: default
title: cryptsetup
---

## {{ page.title }}

### Encrypting a partiton

(Optional) Generate a keyfile:

    $ dd if=/dev/urandom of=/etc/luks/secretkey bs=512 count=4

Create an encrypted device in LUKS format:

    $ cryptsetup --cipher aes-xts-plain64 --key-size 256 --hash sha1 --verbose luksFormat /dev/sdXY [secretkey]

Opening the device:

    $ cryptsetup open --type luks [--allow-discards] [--key-file secretkey] /dev/sdXY mydisk

Formating the device:

    $ mkfs.btrfs -L mydisk /dev/mapper/mydisk

Mounting the device:

    $ mount -o noatime[,discard] /dev/mapper/mydisk /mnt/mydisk

(Optional) Add device to `crypttab`:

    mydisk UUID=`lsblk -f` /etc/luks/secretkey

(Optional) Add device to `fstab`:

    # <fs>                    <mountpoint> <type> <opts> <dump/pass>
    /dev/disk/by-label/mydisk /mydisk      btrfs  noatime    0 1

