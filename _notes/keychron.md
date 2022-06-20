---
layout: default
title: Keychron
---

## {{ page.title }}

For proper handling of F1-F12 keys, **put the keyboard into Mac/iOS mode** and
create `/etc/modprobe.d/hid_apple.conf` with the following content.

    options hid_apple fnmode=2 swap_opt_cmd=1
