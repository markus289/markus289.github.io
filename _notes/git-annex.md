---
layout: default
title: git-annex
---

## {{ page.title }}

- generate a unique name:

        import zlib
        hex(zlib.crc32(bytes("audiobooks", "ascii")))
        > '0x588f46d5'

- create the remote directory

        $ sftp uXXXXXX.your-storagebox.de
        > cd annex/
        > mkdir 588f46d5

- create the sub-account in the web UI of the storage box (enable webdav and external reachability)
- add the remote to the existing (local) git-annex repository

        WEBDAV_USERNAME=uXXXXXX-subX WEBDAV_PASSWORD=FIXME \
        git annex initremote storagebox type=webdav \
        url=https://uXXXXXX-subX.your-storagebox.de \
        encryption=shared
