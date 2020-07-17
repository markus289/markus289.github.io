---
layout: default
title: systemd
---

## {{ page.title }}

### Using sytemd-networkd

Replacing NetworkManage with systemd-networkd

    cat << EOF > /etc/systemd/network/80-dhcp.network
    [Match]
    Name=en* wl*

    [Network]
    DHCP=yes

    [DHCP]
    ClientIdentifier=mac
    EOF
    systemctl disable --now NetworkManager
    systemctl mask NetworkManager
    systemctl disable --now ModemManager
    systemctl mask ModemManager
    systemctl enable --now systemd-networkd
    systemctl enable --now systemd-resolved
    ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

### Using systemd-networkd with a bridge

`/etc/systemd/network/br0.netdev`:

    [NetDev]
    Name=br0
    Kind=bridge

`/etc/systemd/network/br0.network`:

    [Match]
    Name=br0

    [Network]
    DHCP=yes

    [DHCP]
    ClientIdentifier=mac

`/etc/systemd/network/uplink.network`:

    [Match]
    Name=enpXsY

    [Network]
    Bridge=br0
