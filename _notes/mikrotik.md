---
layout: default
title: Mikrotik
---

## {{ page.title }}

### Blackhole Networks

    /ipv6 route add dst-address=2620:0:1c00::/40 type=unreachable comment=facebook
    /ip route add dst-address=102.132.100.0/24 type=unreachable comment=facebook

### Remove Routes by Comment

    /ipv6 route remove [find comment="facebook"]
    /ip route remove [find comment="facebook"]
