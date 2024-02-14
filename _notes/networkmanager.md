---
layout: default
title: NetworkManager
---

## {{ page.title }}

### List Connections

    nmcli connection

### Enable IPv6 Privacy Extension

    nmcli connection modify some\ connection ipv6.ip6-privacy 2

### Limit Wi-Fi Connection to 5 GHz

    nmcli connection modify some\ connection wifi.band a
