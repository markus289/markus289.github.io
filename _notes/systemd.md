---
layout: default
title: systemd
---

# {{ page.title }}

`/etc/systemd/network/80-dhcp.network` for using networkd with DHCP.

    [Match]
    Name=enp2s0

    [Network]
    DHCP=yes

    [DHCP]
    ClientIdentifier=mac
