---
layout: default
title: Microsoft Windows
---

## {{ page.title }}

### Putting a Windows ISO on a USB drive

This is tested with Windows 7 and Windows 8 ISO images.

The partition type must be of type NTFS (`7`) and the partiton needs the bootable flag.

    $ umount /dev/sdb
    $ fdisk /dev/sdb
    $ mkfs.ntfs -f /dev/sdb1
    $ mount -o loop,ro windows.iso /mnt/iso
    $ ntfs-3g /dev/sdb1 /mnt/usb
    $ cp -av /mnt/iso/* /mnt/usb

If you have a machine that needs to boot using legacy BIOS mode, then you need
to write a Microsoft boot block to it.

    $ ms-sys -7 /dev/sdb

