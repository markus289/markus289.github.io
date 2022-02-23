---
layout: default
title: Ubiquiti
---

## {{ page.title }}

### TFTP Recovery for Bricked Access Points

[(Source)](https://help.ui.com/hc/en-us/articles/204910124-UniFi-TFTP-Recovery-for-Bricked-Access-Points)

The instructions are incomplete.
The access point may not have a default IP address of `192.168.1.20`.
There are [reports](https://community.ui.com/questions/U6-Lite-TFTP-Recovery-wont-work/b2f6e37b-4161-418c-98a5-6976178a7250)
that the default address is `192.168.1.{31-33}`.
In my case, the default IP address for a [UniFi 6 LR](https://eu.store.ui.com/products/unifi-6-long-range-access-point-1)
was `192.168.1.32`.

It may help to run `nmap -sL 192.168.1.0/24` while `watch arp` in another
terminal.

Easier instructions are as follows.

1. Set the IP address of your PC to `192.168.1.25/24`.
1. Put the access point into TFTP recovery mode by removing it from the power
   source, pressing the reset button, then reattaching the power while still
   holding the reset button.
   Once the lights flash white-blue-off-repeat, the access point is in TFTP
   mode.
1. Start `tftp` on a Linux or Mac.

        $ tftp
        tftp> connect 192.168.1.32
        tftp> binary
        tftp> timeout 60
        tftp> put firmware.bin
        Sent 14649771 bytes in 18.6 seconds

1. Now wait until the access point's LED stays white.

The default IP address _after resetting_ will be `192.168.1.20`.
