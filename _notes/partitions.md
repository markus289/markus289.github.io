---
layout: default
title: Erasing Partitions
---

## {{ page.title }}

### Erasing Partitions

Use `wipefs` to erase all parition tables, not only for example a DOS parition table.
This is especially helpful when there are ISO file systems on an USB stick from `dd`-ing an ISO file.

    # wipefs /dev/sdb
    offset               type
    ----------------------------------------------------------------
    0x200                gpt   [partition table]

    0x1fe                dos   [partition table]

    0x8001               iso9660   [filesystem]
                         LABEL: CentOS 7 x86_64
                         UUID:  2017-09-05-14-14-50-00

    # wipefs -a /dev/sdb
    /dev/sdb: 5 bytes were erased at offset 0x00008001 (iso9660): 43 44 30 30 31
    /dev/sdb: 2 bytes were erased at offset 0x000001fe (dos): 55 aa
    /dev/sdb: 8 bytes were erased at offset 0x00000200 (gpt): 45 46 49 20 50 41 52 54
    /dev/sdb: calling ioctl to re-read partition table: Success
