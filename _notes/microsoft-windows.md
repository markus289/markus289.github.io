---
layout: default
title: Microsoft Windows
---

## {{ page.title }}

### Putting a Windows ISO on a USB drive

This is tested with Windows 7, 8, and 10 ISO images.

There are two options to create the file system on the USB drive.

1. A bare partition, i.e. `mkfs.ntfs -f /dev/sdb`
2. A DOS partition layout, i.e. `mkfs.ntfs -f /dev/sdb1`.
   Here, the partition type must be of type NTFS (`7`) and the partiton needs the bootable flag.

Then, simply copy the files on the new partiton.

    $ mount -o loop,ro windows.iso /mnt/iso
    $ ntfs-3g /dev/sdX[1] /mnt/usb
    $ cp -av /mnt/iso/* /mnt/usb
