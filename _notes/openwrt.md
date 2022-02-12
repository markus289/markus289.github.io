---
layout: default
title: OpenWRT
---

## {{ page.title }}

### Dumb Access Point

[Dumb Access Point](https://openwrt.org/docs/guide-user/network/wifi/dumbap) documentation.
Note the directions on [IPv6](https://openwrt.org/docs/guide-user/network/wifi/dumbap#ipv6).

### Redirect HTTP

In order to access LuCI by HTTPS only, put `option redirect_https 1` in `/etc/config/uhttpd`.

### Disable SSH Password Authentication

Menu entry `System -> Administration -> SSH Access -> Password authentication`
and `Allow root logins with password`.
