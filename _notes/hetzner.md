---
layout: default
title: Hetzner
---

## {{ page.title }}

### systemd network configuration for Hetzner Cloud

`/etc/systemd/network/20-static.network`:

    [Match]
    Name=eth0

    [Network]
    DHCP=ipv4
    Address=XXXX:XXXX:XXXX:XXXX::1/64
    Gateway=fe80::1
    DNS=1.1.1.1
    DNS=1.0.0.1

    [DHCPv4]
    UseDNS=false

### OpenBSD network configuration for Hetzner Cloud

`/etc/hostname.vio0`:

    inet XXX.XXX.XXX.XXX 0xffffffff
    inet6 XXXX:XXXX:XXXX:XXXX::1 64
    !route add -inet 172.31.1.1 -llinfo -link -static -iface vio0
    !route add -inet default 172.31.1.1

The address `172.31.1.1` does not change. It is always the same address.

`/etc/mygate`:

    fe80::1%vio0
