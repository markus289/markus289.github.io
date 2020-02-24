---
layout: default
title: OpenBSD
---

## {{ page.title }}

### Network configuration for Hetzner Cloud

`/etc/hostname.vio0`:

    inet XXX.XXX.XXX.XXX 0xffffffff
    inet6 XXXX:XXXX:XXXX:XXXX::1 64
    !route add -inet 172.31.1.1 -llinfo -link -static -iface vio0
    !route add -inet default 172.31.1.1

The address `172.31.1.1` does not change. It is always the same address.
