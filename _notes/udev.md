---
layout: default
title: udev
---

## {{ page.title }}

### Writable USB devices

Put this in `/etc/udev/rules.d/99-nexus.rules` to make a Google Galaxy 5 writeable to the usb group:

    # Make these devices writeable to the usb group.

    # Nexus 5 in default mode
    ATTRS{idVendor}=="18d1", ATTRS{idProduct}=="d002", MODE="0660", GROUP="usb"

    # Nexus 5 in recovery mode
    ATTRS{idVendor}=="18d1", ATTRS{idProduct}=="d001", MODE="0660", GROUP="usb"

    # Nexus 5 in fastboot mode
    ATTRS{idVendor}=="18d1", ATTRS{idProduct}=="4ee0", MODE="0660", GROUP="usb"

Adjust to your own device by replacing `idVendor` and `idProduct` with the values from your device.
These are found, for example, in the output of `lsusb`.
